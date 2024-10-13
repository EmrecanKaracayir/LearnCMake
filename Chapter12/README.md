# 📖 Chapter 12: Modules

This is an overview of Chapter 12, covering the key concepts of CMake modules. It includes details on using modules directly or with `find_package()`, checking compiler and system features, and recommended practices for using modules effectively.

### Introduction to CMake Modules

- Pre-built chunks of CMake code providing additional functionality
- Located in a single directory as part of CMake release
- Two main ways to use modules: directly with `include()` or via `find_package()`

### Using Modules Directly

**Syntax:**

```cmake
include(module [OPTIONAL] [RESULT_VARIABLE myVar] [NO_POLICY_SCOPE])
```

**Module search order:**

1. Directories listed in `CMAKE_MODULE_PATH`
2. CMake's internal module directory

**Exception:** If calling file is in CMake's internal module directory, search there first

### Using Modules with `find_package()`

**Basic syntax:**

```cmake
find_package(PackageName)
```

Searches for FindPackageName.cmake

### Checking Existence and Support

Modules for checking compiler and system features:

#### Compiling and Linking Tests (CMake 3.19+):

**Basic syntax:**

```cmake
include(CheckSourceCompiles)
check_source_compiles(lang code resultVar [FAIL_REGEX regexes...] [SRC_EXT extension])
```

**Earlier versions:**

```cmake
include(Check<LANG>SourceCompiles)
check\_<lang>\_source_compiles(code resultVar [FAIL_REGEX regexes...] [SRC_EXT extension])
```

#### Running Tests (CMake 3.19+):

**Basic syntax:**

```cmake
include(CheckSourceRuns)
check_source_runs(lang code resultVar [SRC_EXT extension])
```

**Earlier versions:**

```cmake
include(Check<LANG>SourceRuns)
check\_<lang>\_source_runs(code resultVar [SRC_EXT extension])
```

#### Compiler Flag Checks (CMake 3.19+):

**Basic syntax:**

```cmake
include(CheckCompilerFlag)
check_compiler_flag(lang flag resultVar)
```

**Earlier versions:**

```cmake
include(Check<LANG>CompilerFlag)
check\_<lang>\_compiler_flag(flag resultVar)
```

#### Linker Flag Checks (CMake 3.18+)

**Basic syntax:**

```cmake
include(CheckLinkerFlag)
check_linker_flag(language flag resultVar)
```

#### Symbol Existence Checks

**Basic syntax:**

```cmake
include(CheckSymbolExists)
check_symbol_exists(symbol headers resultVar)
```

**Earlier versions:**

```cmake
include(CheckCXXSymbolExists)
check_cxx_symbol_exists(symbol headers resultVar)
```

#### Managing Check State

**Basic syntax:**

```cmake
include(CMakePushCheckState)
cmake_push_check_state([RESET])
cmake_pop_check_state()
cmake_reset_check_state()
```

#### Other Notable Modules

- **Language support:** CSharpUtilities, FindCUDAToolkit, FindJava, FindPython, etc.
- **External project interaction:** ExternalProject, FetchContent
- **Testing and packaging support:** CPack, CTest, CTestCoverageCollectGCOV
- **Debugging assistance:** CMakePrintHelpers

### Recommended Practices

1. Use `CMAKE_MODULE_PATH` to include custom modules
2. Regularly review available CMake modules for useful functionality
3. Be cautious with older modules that may not be well-maintained
4. Use Check modules judiciously to avoid slowing down configure stage
5. Isolate checking logic using CMakePushCheckState
6. Avoid deprecated modules (e.g., TestBigEndian for CMake 3.20+)
7. Consider creating organization-specific module collections for reusable logic
8. Learn from and contribute to CMake modules as they are open-source

### Common Use Cases

1. Adding custom module directories:
   ```cmake
   list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
   ```
2. Checking for compiler features:
   ```cmake
   include(CheckCXXCompilerFlag)
   check_cxx_compiler_flag("-std=c++17" COMPILER_SUPPORTS_CXX17)
   if(COMPILER_SUPPORTS_CXX17)
   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17")
   endif()
   ```
3. Checking for library functions:
   ```cmake
   include(CheckSymbolExists)
   check_symbol_exists(pthread_create "pthread.h" HAVE_PTHREAD)
   if(HAVE_PTHREAD)
   target_link_libraries(myapp PRIVATE pthread)
   endif()
   ```
4. Using language-specific utilities:
   ```cmake
   include(UseJava)
   find_package(Java COMPONENTS Development)
   if(Java_FOUND)
   add_jar(myjar MyJavaClass.java)
   endif()
  ```
5. Managing check state for multiple checks:
   ```cmake
   include(CMakePushCheckState)
   cmake_push_check_state()
   set(CMAKE_REQUIRED_LIBRARIES OpenGL::GL)
   check_symbol_exists(glBegin "GL/gl.h" HAVE_GL)
   check_symbol_exists(gluLookAt "GL/glu.h" HAVE_GLU)
   cmake_pop_check_state()
   ```

# 🎯 Workshop

In this workshop, you will practice working with CMake modules. You will use modules directly or with `find_package()` to check compiler and system features, and explore recommended practices for using modules effectively.

### Objectives

- Use modules directly with `include()` to check compiler and system features
- Practice using common modules for checking compiler and system features
- Implement recommended practices for using modules effectively
- Use check modules to verify compiler and system features

### Example output

```plaintext
[CheckSourceCompiles | HAS_SOME_MACRO]
-- Performing Test HAS_SOME_MACRO
-- Performing Test HAS_SOME_MACRO - Success

[CheckSourceRuns | MAIN_RUNS]
-- Performing Test MAIN_RUNS
-- Performing Test MAIN_RUNS - Success
```

### Tips

- Use `include()` to load modules directly
- Explore the available modules from [CMake's official repository](https://cmake.org/cmake/help/latest/manual/cmake-modules.7.html)
- Check the CMake documentation for module-specific details
