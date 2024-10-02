# 📖 Chapter 5: Basic Testing And Deployment

## Testing

CMake provides `ctest` for test scheduling and reporting.

**Basic setup:**

```cmake
enable_testing()
add_executable(testSomething testSomething.cpp)
add_test(NAME SomethingWorks COMMAND testSomething)
add_test(NAME ExternalTool COMMAND /path/to/tool someArg moreArg)
```

**Key points:**

- Use `enable_testing()` after `project()`
- `add_test()` defines test cases
- Test names should use basic characters (letters, numbers, hyphens, underscores)
- `COMMAND` can be an executable target or any shell command
- Default pass criteria: `exit code 0`

**Running tests:**

```shell
cmake -G "Ninja" -B "build" -D CMAKE_BUILD_TYPE="Debug"
cd build
cmake --build .
ctest
```

**For multi-configuration generators:**

```shell
ctest --build-config Debug
```
**Useful `ctest` options:**

- **`--parallel N`:** Run N tests in parallel
- **`--verbose`:** Show full output
- **`--output-on-failure`:** Show output only for failing tests

CMake also provides a test build target, but it's less flexible than running `ctest` directly.

### Installing

CMake's `install()` command manages deployment.

**Basic example:**

```cmake
add_executable(MyApp ...)
add_library(AlgoRuntime SHARED ...)
add_library(AlgoSDK STATIC ...)
install(TARGETS MyApp AlgoRuntime AlgoSDK)
```

**Key points:**

- CMake 3.14+ uses default install locations if not specified
- Earlier versions require explicit `DESTINATION` specifications
- Can install files and directories with `install(FILES ...)` and `install(DIRECTORY ...)`
- CMake 3.23+ introduces file sets for more convenient header installation

**Running an install:**

```cmake
cmake -G Ninja -B build -DCMAKE_BUILD_TYPE=Debug
cd build
cmake --build .
cmake --install . --prefix /path/to/somewhere
For multi-configuration generators:

cmake --install . --config Debug --prefix /path/to/somewhere
CMake also provides an install build target, but it's less flexible than cmake --install.
Packaging
CMake's cpack tool creates binary packages in various formats.
Basic setup:

set(CPACK_PACKAGE_NAME MyProj)
set(CPACK_PACKAGE_VENDOR MyCompany)
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "An example project")
set(CPACK_PACKAGE_INSTALL_DIRECTORY ${CPACK_PACKAGE_NAME})
set(CPACK_VERBATIM_VARIABLES TRUE)
include(CPack)
Creating packages:

cmake -G Ninja -B build -DCMAKE_BUILD_TYPE=Release
cd build
cmake --build .
cpack -G "ZIP;WIX"
For multi-configuration generators:

cpack -G "ZIP;WIX" --config Release
CMake provides a package build target, but direct use of cpack is more flexible.
Recommended Practices
	1.	Familiarize yourself with ctest and cpack command-line tools
	2.	Perform test installs to temporary staging areas
	3.	Avoid direct installs to permanent or system-wide locations
	4.	Use binary packages for installation when possible
	5.	For CMake 3.23+, use file sets for header management
	6.	When using the package build target, set CPACK_GENERATOR based on the platform:

if(WIN32)
  set(CPACK_GENERATOR ZIP WIX)
elseif(APPLE)
  set(CPACK_GENERATOR TGZ productbuild)
elseif(CMAKE_SYSTEM_NAME STREQUAL "Linux")
  set(CPACK_GENERATOR TGZ RPM)
else()
  set(CPACK_GENERATOR TGZ)
endif()

These practices help streamline the testing, installation, and packaging processes, making project deployment more robust and flexible across different platforms and configurations.

# 🎯 Workshop

This workshop focuses on multi-project CMake setup and different dependency types. It is best to create single executable and many libraries. We will use `add_subdirectory()` to include the projects to solution.

### Dependency graph

![Workshop's dependency graph](docs/dependency-graph.png)

The graph shows the dependencies between the projects. The arrows indicate the direction of the dependencies.

There are different types of targets and dependencies:

- `App` is the main executable that depends on `Log`, `Geometry`, and `Statistics`. The dependencies are `PRIVATE` because they are internal to the `App`.
- `Log` is a library that depends on `IO`. The dependency is `PUBLIC` because `App` also needs `IO`.
- `Geometry` is a library that depends on `Math`. The dependency is `PRIVATE` because we need to demonstrate the `PRIVATE` dependency.
- `Statistics` is a library that depends on `Math`. The dependency is `PUBLIC` because we need to demonstrate the `PUBLIC` dependency.
- `Math` is a header-only library that doesn't have any dependencies. It is an `INTERFACE` library.

### Objectives

1. Create a similar multi-project CMake setup like the following structure:

```plaintext
┌─📂 build
│  └─...
├─📂 cmake
│  └─📄 language.cmake
├─📂 projects
│  ├─📂 App
│  │  ├─📂 source
│  │  │  └─📄 main.cpp
│  │  └─📄 CMakeLists.txt
│  ├─📂 Geometry
│  │  ├─📂 include
│  │  │  └─📂 Geometry
│  │  │     └─📄 Rectangle.hpp
│  │  ├─📂 source
│  │  │  └─📂 Geometry
│  │  │     └─📄 Rectangle.cpp
│  │  └─📄 CMakeLists.txt
│  ├─📂 IO
│  │  ├─📂 include
│  │  │  └─📂 IO
│  │  │     ├─📄 input.hpp
│  │  │     └─📄 output.hpp
│  │  └─📄 CMakeLists.txt
│  ├─📂 Log
│  │  ├─📂 include
│  │  │  └─📂 Log
│  │  │     └─📄 log.hpp
│  │  ├─📂 source
│  │  │  └─📂 Log
│  │  │     └─📄 log.cpp
│  │  └─📄 CMakeLists.txt
│  ├─📂 Math
│  │  ├─📂 include
│  │  │  └─📂 Math
│  │  │     ├─📄 addition.hpp
│  │  │     ├─📄 division.hpp
│  │  │     ├─📄 multiplication.hpp
│  │  │     └─📄 subtraction.hpp
│  │  ├─📂 source
│  │  │  └─📂 Math
│  │  │     ├─📄 addition.cpp
│  │  │     ├─📄 division.cpp
│  │  │     ├─📄 multiplication.cpp
│  │  │     └─📄 subtraction.cpp
│  │  └─📄 CMakeLists.txt
│  └─📂 Statistics
│     ├─📂 include
│     │  └─📂 Statistics
│     │     └─📄 average.hpp
│     ├─📂 source
│     │  └─📂 Statistics
│     │     └─📄 average.cpp
│     └─📄 CMakeLists.txt
├─📂 tools
│  ├─📄 build.fish
│  └─📄 build.ps1
└─📄 CMakeLists.txt
```

2. Define the projects in the project's `CMakeLists.txt` file.
3. Include the projects in the top-level `CMakeLists.txt` file via `add_subdirectory()`.
4. Link the targets with different dependency types.

#### Example C++ code

![Example C++ code](docs/example-code.png)

#### Example output

![Example output](docs/example-output.png)

### Tips

- Use `add_subdirectory()` to include projects in the top-level `CMakeLists.txt`.
- Use `target_sources()` to add source files to the targets.
- Use `target_link_libraries()` to link the targets with the correct dependency types.
- Use `PRIVATE`, `PUBLIC`, or `INTERFACE` in `target_link_libraries()` to define the dependencies.
- Refer to **remark** for the explanation of `PRIVATE`, `PUBLIC`, and `INTERFACE` dependencies.
- If you encounter issues, refer to the [CMake documentation](https://cmake.org/documentation/) or the provided solutions
