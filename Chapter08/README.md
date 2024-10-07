# 📖 Chapter 8: Using Subdirectories

This is an overview of Chapter 8, covering the key concepts of using subdirectories in CMake. It includes examples and explanations of the various commands and best practices discussed in the chapter.

### Introduction

- Multi-directory projects are common in real-world scenarios
- Key commands: `add_subdirectory()` and `include()`
- Benefits of multi-directory structure:
  - Localized build logic
  - Independent subcomponents
  - Easy to enable/disable parts of the build

### `add_subdirectory()`

The `add_subdirectory()` command brings another directory with its own `CMakeLists.txt` into the build. It creates a corresponding directory in the build tree.

**Syntax:**

```cmake
add_subdirectory(sourceDir [binaryDir]
  [EXCLUDE_FROM_ALL]
  [SYSTEM] # CMake 3.25+
)
```

**Key points:**

- Brings another directory with its own `CMakeLists.txt` into the build
- Creates corresponding directory in build tree
- `sourceDir` can be absolute or relative path
- `binaryDir` is optional, defaults to same name as `sourceDir` in build tree

#### Source and Binary Directory Variables

- `CMAKE_SOURCE_DIR`: Top-most source directory
- `CMAKE_BINARY_DIR`: Top-most build directory
- `CMAKE_CURRENT_SOURCE_DIR`: Current source directory being processed
- `CMAKE_CURRENT_BINARY_DIR`: Current build directory being processed

#### Scope

- Creates a new variable scope for the subdirectory
- Variables from parent scope are copied to child scope
- Changes in child scope don't affect parent scope
- `PARENT_SCOPE` keyword can be used to modify parent scope

#### When to Call `project()`

- Must be called in top-level `CMakeLists.txt`
- Optional in subdirectories
- Can be useful for creating trimmed-down views in IDEs

### `include()`

The `include()` command processes a file as if its contents were written in the including file. It doesn't introduce a new variable scope.

**Syntax:**

```cmake
include(fileName [OPTIONAL] [RESULT_VARIABLE myVar] [NO_POLICY_SCOPE])
include(module [OPTIONAL] [RESULT_VARIABLE myVar] [NO_POLICY_SCOPE])
```

**Key differences from `add_subdirectory()`:**

- Expects a file name, not a directory
- Doesn't introduce new variable scope
- Can disable policy scope with `NO_POLICY_SCOPE`
- Doesn't change `CMAKE_CURRENT_SOURCE_DIR` and `CMAKE_CURRENT_BINARY_DIR`

**Additional variables:**

- `CMAKE_CURRENT_LIST_DIR`: Directory of current file being processed
- `CMAKE_CURRENT_LIST_FILE`: Name of current file being processed
- `CMAKE_CURRENT_LIST_LINE`: Line number in current file

### Project-relative Variables

- `PROJECT_SOURCE_DIR`: Source directory of most recent `project()` call
- `PROJECT_BINARY_DIR`: Corresponding build directory
- `<ProjectName>_SOURCE_DIR`: Source directory for specific project
- `<ProjectName>_BINARY_DIR`: Corresponding build directory for specific project
- `PROJECT_IS_TOP_LEVEL`: True if current project is top-level (CMake 3.21+)
- `<ProjectName>_IS_TOP_LEVEL`: True if specific project is top-level (CMake 3.21+)

### Ending Processing Early

- `return()` command ends processing of current file
- `return(PROPAGATE var1 var2 ...)` propagates variables to parent scope (CMake 3.25+)
- `include_guard()` prevents multiple inclusion of a file (CMake 3.10+)

### Recommended Practices

1. Prefer `add_subdirectory()` for simpler projects
2. Use `CMAKE_CURRENT_LIST_DIR` instead of `CMAKE_CURRENT_SOURCE_DIR`
3. Avoid `CMAKE_SOURCE_DIR` and `CMAKE_BINARY_DIR`, prefer project-relative variables
4. Avoid using `return(PROPAGATE)` to end file processing
5. Use `include_guard()` instead of manual include guards (CMake 3.10+)
6. Only call `project()` in subdirectories if they can be standalone projects
7. Be cautious when propagating variables between scopes, prefer target-centered approaches

# 🎯 Workshop

In this workshop, you will create a new project with a `CMakeLists.txt` file and demonstrate the usage of subdirectories, `add_subdirectory()`, and `include()` commands.

### Objectives

1. Create a new project with a `CMakeLists.txt` file.
2. Add `projects` folder for subdirectories.
3. Create a project in the `projects/<ProjectName>` folder with its own `CMakeLists.txt`.
4. Use `add_subdirectory()` to include the project in the main `CMakeLists.txt`.
5. Add `cmake` folder for additional scripts.
6. Create a script in the `cmake` folder and include it using `include()` in the main `CMakeLists.txt`.
7. Add and test `include_guard()` to prevent multiple inclusions of the script.
8. Experiment with CMake variables in different scopes.
9. Use project-relative variables and pass variables between scopes.

#### Example output

> **Remark:** The output below is an example of the expected messages when running the workshop's `CMakeLists.txt` file. The messages are generated using `message()` commands to display variable values and other information during the CMake configuration process.
>
> In this example, the messages are categorized by the scope in which they are generated:
>
> - `TOPDIR` stands for output from top-level script
> - `INCDIR` stands for output from included script
> - `SUBDIR` stands for output from subdirectory script

```cmake
[INCDIR | Include guard]
  This message will be displayed every time
  This message will be displayed only once

[INCDIR | Conditions]
  PROJECT_IS_TOP_LEVEL       > ON
  SLN_Chapter08_IS_TOP_LEVEL > ON

[INCDIR | Paths]
  CMAKE_SOURCE_DIR         > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08
  CMAKE_BINARY_DIR         > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/build
  CMAKE_CURRENT_SOURCE_DIR > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08
  CMAKE_CURRENT_BINARY_DIR > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/build

[INCDIR | List paths]
  CMAKE_CURRENT_LIST_DIR  > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/cmake
  CMAKE_CURRENT_LIST_FILE > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/cmake/include.cmake
  CMAKE_CURRENT_LIST_LINE > 25

[INCDIR | Project paths]
  PROJECT_SOURCE_DIR       > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08
  PROJECT_BINARY_DIR       > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/build
  SLN_Chapter08_SOURCE_DIR > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08
  SLN_Chapter08_BINARY_DIR > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/build

[INCDIR | Variables]
  [create] CH08_VAR_INCDIR < created in incdir

[INCDIR | Return]
  This message will be displayed

[TOPDIR | Conditions]
  PROJECT_IS_TOP_LEVEL       > ON
  SLN_Chapter08_IS_TOP_LEVEL > ON

[TOPDIR | Paths]
  CMAKE_SOURCE_DIR         > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08
  CMAKE_BINARY_DIR         > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/build
  CMAKE_CURRENT_SOURCE_DIR > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08
  CMAKE_CURRENT_BINARY_DIR > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/build

[TOPDIR | Project paths]
  PROJECT_SOURCE_DIR       > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08
  PROJECT_BINARY_DIR       > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/build
  SLN_Chapter08_SOURCE_DIR > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08
  SLN_Chapter08_BINARY_DIR > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/build

[TOPDIR | Variables]
  [create] CH08_VAR_TOPDIR < created in topdir
  [create] CH08_VAR_PARENT < created in topdir
  [create] CH08_VAR_PRPGTE < created in topdir
  [access] CH08_VAR_INCDIR > created in incdir
  [update] CH08_VAR_INCDIR < updated in topdir

[SUBDIR | Conditions]
  PROJECT_IS_TOP_LEVEL       > OFF
  SLN_Chapter08_IS_TOP_LEVEL > ON
  PRJ_Chapter08_IS_TOP_LEVEL > OFF

[SUBDIR | Paths]
  CMAKE_SOURCE_DIR         > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08
  CMAKE_BINARY_DIR         > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/build
  CMAKE_CURRENT_SOURCE_DIR > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/projects/Chapter08
  CMAKE_CURRENT_BINARY_DIR > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/build/projects/Chapter08

[SUBDIR | Project paths]
  PROJECT_SOURCE_DIR       > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/projects/Chapter08
  PROJECT_BINARY_DIR       > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/build/projects/Chapter08
  SLN_Chapter08_SOURCE_DIR > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08
  SLN_Chapter08_BINARY_DIR > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/build
  PRJ_Chapter08_SOURCE_DIR > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/projects/Chapter08
  PRJ_Chapter08_BINARY_DIR > /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter08/build/projects/Chapter08

[SUBDIR | Variables]
  [create] CH08_VAR_SUBDIR < created in subdir
  [access] CH08_VAR_TOPDIR > created in topdir
  [update] CH08_VAR_TOPDIR < updated in subdir // Updated in subdir
  [access] CH08_VAR_PARENT > created in topdir
  [update] CH08_VAR_PARENT < updated in subdir // Updated in both scopes
  [update] CH08_VAR_PARENT < updated in subdir // Updated in subdir
  [update] CH08_VAR_INCDIR < updated in subdir // Updated in both scopes

[SUBDIR | Return (propagate)]
  CH08_VAR_PRPGTE <-> updated in subdir

[TOPDIR | Variables]
  [access] CH08_VAR_TOPDIR > created in topdir
  [access] CH08_VAR_PARENT > updated in subdir
  [access] CH08_VAR_PRPGTE > updated in subdir
  [access] CH08_VAR_INCDIR > updated in subdir

[INCDIR | Include guard]
  This message will be displayed every time
```

### Tips

- Experiment with different variable scopes to understand their behavior
- Use project-relative variables to maintain context
- Test the behavior of `include_guard()` with multiple inclusions
- Pass variables between scopes to understand their visibility
- Use `return(PROPAGATE)` to propagate variables between scopes
- If you encounter issues, review the messages generated by `message()` commands
- Finally, check my solution for this workshop under the `Chapter08` directory
