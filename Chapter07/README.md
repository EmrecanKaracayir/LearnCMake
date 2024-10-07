# 📖 Chapter 7: Flow Control

This is an overview of Chapter 7, covering the key concepts of flow control in CMake. It includes examples and explanations of the various commands and best practices discussed in the chapter.

### The `if()` Command

The `if()` command is used for conditional execution in CMake. It evaluates expressions and executes commands based on the result.

**Basic structure:**

```cmake
if(expression1)
  # commands ...
elseif(expression2)
  # commands ...
else()
  # commands ...
endif()
```

#### Basic Expressions

- **True constants:** `ON`, `YES`, `TRUE`, `Y` (case-insensitive)
- **False constants:** `OFF`, `NO`, `FALSE`, `N`, `IGNORE`, `NOTFOUND`, empty string, ends with `-NOTFOUND`
- **Numbers:** 0 is false, non-zero is true
- **Variables:** Evaluated as true if not matching false constants
- **Quoted strings:** Behavior depends on CMake version and policies

#### Logic Operators

- `AND`, `OR`, `NOT`
- Parentheses for precedence

**Example:**

```cmake
if(NOT (expression1 AND (expression2 OR expression3)))
  # commands ...
endif()
```

#### Comparison Tests

- **Categories:** Numeric, String, Version numbers, Path
- **Operators:**
  - **Numeric:** `LESS`, `GREATER`, `EQUAL`, `LESS_EQUAL`, `GREATER_EQUAL`
  - **String:** `STRLESS`, `STRGREATER`, `STREQUAL`, `STRLESS_EQUAL`, `STRGREATER_EQUAL`
  - **Version:** `VERSION_LESS`, `VERSION_GREATER`, `VERSION_EQUAL`, `VERSION_LESS_EQUAL`, `VERSION_GREATER_EQUAL`
  - **Path:** `PATH_EQUAL` (CMake 3.24+)

**Regular expression matching:**

```cmake
if(value MATCHES regex)
  # commands ...
endif()
```

#### File System Tests

- `EXISTS`
- `IS_DIRECTORY`
- `IS_SYMLINK`
- `IS_ABSOLUTE`
- `IS_NEWER_THAN`
- `IS_READABLE`, `IS_WRITABLE`, `IS_EXECUTABLE` (CMake 3.29+)

#### Existence Tests

- `DEFINED`: Check if variable exists
- `COMMAND`: Check if command, function, or macro exists
- `POLICY`: Check if policy exists
- `TARGET`: Check if target exists
- `TEST`: Check if test exists (CMake 3.4+)
- `IN_LIST`: Check if value is in list (CMake 3.3+)

### Looping

Loops in CMake are implemented using the `foreach()` and `while()` commands.

#### The `foreach()` command

The `foreach()` command iterates over a list of items or a range of values.

**Basic form:**

```cmake
foreach(loopVar arg1 arg2 ...)
  # ...
endforeach()
```

**_General form:_**

```cmake
foreach(loopVar IN [LISTS listVar1 ...] [ITEMS item1 ...])
  # ...
endforeach()
```

**`ZIP_LISTS` form (CMake 3.17+):**

```cmake
foreach(loopVar... IN ZIP_LISTS listVar...)
  # ...
endforeach()
```

**`RANGE` form:**

```cmake
foreach(loopVar RANGE start stop [step])
  # ...
endforeach()
```

#### The `while()` command

The `while()` command executes a block of commands repeatedly as long as a condition is true.

**Structure:**

```cmake
while(condition)
  # ...
endwhile()
```

#### Interrupting Loops

- `break()`: Exit loop early
- `continue()`: Skip to next iteration

**Example:**

```cmake
foreach(outerVar IN ITEMS a b c)
  foreach(innerVar IN ITEMS 1 2 3)
    if(condition1)
      break()
    endif()
    if(condition2)
      continue()
    endif()
  endforeach()
endforeach()
```

### Recommended Practices

1. Minimize unintentional string-to-variable conversions in `if()`, `foreach()`, and `while()`
2. Set minimum CMake version to at least 3.1 and ensure policy `CMP0054` is `NEW`
3. Store `CMAKE_MATCH_N` results in variables immediately after regex matching
4. Use clear and unambiguous looping constructs (e.g., `IN LISTS`, `IN ITEMS`)
5. Always specify `start` and `end` values in `RANGE` form of `foreach()`
6. Prefer string comparison operations over unary expressions with quotes
7. Be cautious with file system tests, especially `IS_NEWER_THAN`
8. Use appropriate variables for platform or compiler-specific logic (e.g., MSVC instead of WIN32 for Visual Studio)
9. Test for specific conditions rather than making assumptions (e.g., `CMAKE_GENERATOR` for Xcode-specific settings)
10. Use options and cache variables for conditional inclusion of targets or subdirectories

# 🎯 Workshop

In this workshop, you will create a new project with a `CMakeLists.txt` file and demonstrate the usage of flow control commands such as `if()`, `foreach()`, and `while()`.

### Objectives

1. Create a new project with a `CMakeLists.txt` file.
2. Use the `if()` command to conditionally set a variable based on a condition.
3. Write examples for basic expressions, logic operators, comparison tests, and file system tests.
4. Use the `foreach()` command in various forms to iterate over lists and ranges.
5. Implement a `while()` loop with a condition that changes during execution.
6. Test the project with different configurations to verify the flow control behavior.

### Tips

- Use `message()` commands to print the results of flow control commands.
- Run Chapter07 workshop to see examples of flow control in CMake.
