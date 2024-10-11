# 📖 Chapter 9: Functions and Macros

This is an overview of Chapter 9, covering the key concepts of using functions and macros in CMake. It includes examples and explanations of the various commands and best practices discussed in the chapter.

### The Basics

Functions and macros are essential for code reuse and organization in CMake. They allow you to encapsulate logic and parameters, making your CMake code more modular and maintainable.

**Function definition:**

```cmake
function(name [arg1 [arg2 [...]]])
  # Function body
endfunction()
```

**Macro definition:**

```cmake
macro(name [arg1 [arg2 [...]]])
  # Macro body
endmacro()
```

**Key differences:**

- Functions introduce a new scope; macros do not
- Function arguments become variables; macro arguments are string replacements

### Argument Handling Essentials

Argument handling is a crucial aspect of functions and macros. CMake provides various ways to handle arguments, including positional arguments, keyword arguments, and special variables.

- **Functions:** Arguments are variables
- **Macros:** Arguments are string replacements
- **Special variables:** `ARGC`, `ARGV`, `ARGN`, `ARGV<N>`

**Example:**

```cmake
function(add_mytest targetName)
  add_executable(${targetName} ${ARGN})
  target_link_libraries(${targetName} PRIVATE foobar)
  add_test(NAME ${targetName} COMMAND ${targetName})
endfunction()
```

#### Keyword Arguments

CMake 3.15 introduced `cmake_parse_arguments()` for flexible keyword-based argument handling. Use it to parse arguments and set variables based on keywords.

```cmake
cmake_parse_arguments(
  prefix
  "${valuelessKeywords}" "${singleValueKeywords}" "${multiValueKeywords}"
  ${ARGN}
)
```

**Example:**

```cmake
function(func)
  set(noValues ENABLE_NET COOL_STUFF)
  set(singleValues TARGET)
  set(multiValues SOURCES IMAGES)

  cmake_parse_arguments(
    arg
    "${noValues}" "${singleValues}" "${multiValues}"
    ${ARGN}
  )

  # Use parsed arguments
  if(arg_ENABLE_NET)
    # ...
  endif()
  # ...
endfunction()
```

There is another way to handle keyword arguments using `cmake_parse_arguments()` with the `PARSE_ARGV` form.

```cmake
cmake_parse_arguments(
  PARSE_ARGV 0 arg
  "${noValues}" "${singleValues}" "${multiValues}"
)
```

- `PARSE_ARGV 0` tells CMake to parse the arguments starting from index 0.
- `arg` is the prefix for the parsed arguments.
- There is no need to pass `${ARGN}` explicitly because it is automatically parsed.

##### Differences Between `cmake_parse_arguments()` and `cmake_parse_arguments(PARSE_ARGV 0)`

- `cmake_parse_arguments()` processes the arguments passed to the function or macro.
- The `PARSE_ARGV` is only available for functions and not for macros.
- `cmake_parse_arguments(PARSE_ARGV 0)` processes the arguments starting from index 0.
- The `PARSE_ARGV` form is more concise and avoids passing `${ARGN}` explicitly.
- The `PARSE_ARGV` form is available in CMake 3.15 and later.
- The `PARSE_ARGV` form is more robust and less error-prone.

### Returning Values

#### From Functions (CMake 3.25+)

Use `return(PROPAGATE var1 var2 ...)`:

```cmake
function(doSomething outVar)
  set(${outVar} 42)
  return(PROPAGATE ${outVar})
endfunction()
```

#### From Functions (earlier versions)

Use `PARENT_SCOPE`:

```cmake
function(func resultVar1 resultVar2)
  set(${resultVar1} "First result" PARENT_SCOPE)
  set(${resultVar2} "Second result" PARENT_SCOPE)
endfunction()
```

#### From Macros

Directly modify variables (no `PARENT_SCOPE` needed):

```cmake
macro(func resultVar1 resultVar2)
  set(${resultVar1} "First result")
  set(${resultVar2} "Second result")
endmacro()
```

### Overriding Commands

- Avoid relying on the undocumented behavior of prepending underscores
- Be cautious when overriding commands to prevent infinite recursion

### Special Variables for Functions (CMake 3.17+)

- `CMAKE_CURRENT_FUNCTION`: Name of the current function
- `CMAKE_CURRENT_FUNCTION_LIST_FILE`: File where the function is defined
- `CMAKE_CURRENT_FUNCTION_LIST_DIR`: Directory where the function is defined
- `CMAKE_CURRENT_FUNCTION_LIST_LINE`: Line number where the function is defined

### Other Ways of Invoking CMake Code

CMake provides several commands for invoking CMake code within a script:

#### `cmake_language()` (CMake 3.18+)

- `CALL`: Invoke a single command
- `EVAL CODE:` Execute arbitrary CMake script

#### `cmake_language(DEFER)` (CMake 3.19+)

Queue commands for later execution:

```cmake
cmake_language(DEFER
  [DIRECTORY dir]
  CALL command [args...]
)
```

### Problems with Argument Handling

- List flattening
- Empty argument preservation
- Special cases with `cmake_language()` and boolean expressions

#### Parsing Arguments Robustly

Use `PARSE_ARGV` form of `cmake_parse_arguments()`:

```cmake
cmake_parse_arguments(
  PARSE_ARGV 0 arg
  "${noValues}" "${singleValues}" "${multiValues}"
)
```

#### Forwarding Command Arguments

Robust forwarding (CMake 3.18+):

```cmake
function(outer)
  cmake_parse_arguments(PARSE_ARGV 0 fwd "" "" "")
  set(quotedArgs "")
  foreach(arg IN LISTS fwd_UNPARSED_ARGUMENTS)
    string(APPEND quotedArgs " [===[${arg}]===]")
  endforeach()
  cmake_language(EVAL CODE "inner(${quotedArgs})")
endfunction()
```

### Recommended Practices

1. Prefer functions over macros
2. Pass all required values as arguments
3. Use keyword-based argument handling (`cmake_parse_arguments()`)
4. Be aware of empty argument and list flattening issues
5. Use PARSE_ARGV form of `cmake_parse_arguments()` when possible
6. Avoid complex, multi-responsibility functions
7. Use `cmake_language(DEFER)` sparingly
8. Collect functions and macros in a dedicated directory
9. Don't define functions/macros with names starting with a single underscore
10. Don't override built-in CMake commands
11. Use `CMAKE_CURRENT_FUNCTION_LIST_DIR` for relative paths (CMake 3.17+)

# 🎯 Workshop

In this workshop, you will create a new project with a `CMakeLists.txt` file and demonstrate the usage of functions, macros, and argument handling in CMake.

### Objectives

1. Create a new project with a `CMakeLists.txt` file.
2. Define a simple function and macro which doesn't take any arguments.
3. Define a function and macro with arguments and demonstrate argument handling.
4. Use `cmake_parse_arguments()` to handle keyword arguments.
5. Return values from functions and macros.
6. Demonstrate the use of special variables for functions.
7. Override a built-in CMake command.
8. Use `cmake_language()` to invoke CMake code.
9. Use `cmake_language(DEFER)` to queue commands for later execution
10. Demonstrate best practices for functions and macros.

#### Example output

```cmake
*-----------*
| FUNCTIONS |
*-----------*

[Function | print_hello_world()]
  Arguments:
    ARGC = 0
    ARGV =
    ARGN =
  Hello, World!

[Function | print_hello(SUBJECT)]
  Arguments:
    ARGC = 1
    ARGV = CMake
    ARGN =
  Hello, CMake!

[Function | log(LEVEL MESSAGE)]
  Arguments:
    ARGC = 2
    ARGV = ERROR;Something went wrong!
    ARGN =
  [ERROR] | Something went wrong!

[Function | log(LEVEL MESSAGE)]
  Arguments:
    ARGC = 3
    ARGV = ERROR;Some other thing went wrong!;Some extra information.
    ARGN = Some extra information.
  [ERROR] | Some other thing went wrong!
  [EXTRA] | Some extra information.

[Function | shop()]
  Arguments:
    ARGC = 7
    ARGV = NOW;PAY_WITH;debit card;THINGS;apples;bananas;oranges
    ARGN = NOW;PAY_WITH;debit card;THINGS;apples;bananas;oranges
[i]: Setting NO_VALUE_ARGS to NOW
[i]: Setting ONE_VALUE_ARGS to PAY_WITH
[i]: Setting MULTI_VALUE_ARGS to THINGS
  Going shopping now!
  Paying with: debit card
  Buying things:
    - apples
    - bananas
    - oranges

[Function | shop()]
  Arguments:
    ARGC = 6
    ARGV = PAY_WITH;credit card;THINGS;grapes;kiwi;lemon
    ARGN = PAY_WITH;credit card;THINGS;grapes;kiwi;lemon
[i]: Setting NO_VALUE_ARGS to NOW
[i]: Setting ONE_VALUE_ARGS to PAY_WITH
[i]: Setting MULTI_VALUE_ARGS to THINGS
  Going shopping later!
  Paying with: credit card
  Buying things:
    - grapes
    - kiwi
    - lemon
[i]: Setting CH09_FUN_VAR to value

[Function | print_variable(VARIABLE)]
  Arguments:
    ARGC = 1
    ARGV = CH09_FUN_VAR
    ARGN =
  VARIABLE: value

Before calling create_dice(): CH09_FUN_LST_DICE =
[Function | create_dice(LST_DICE)]
  Arguments:
    ARGC = 1
    ARGV = CH09_FUN_LST_DICE
    ARGN =
[i]: Setting CH09_FUN_LST_DICE to 1;2;3;4;5;6
After calling create_dice(): CH09_FUN_LST_DICE = 1;2;3;4;5;6

Before calling modify_dice(): CH09_FUN_LST_DICE = 1;2;3;4;5;6
[Function | modify_dice()]
  Arguments:
    ARGC = 0
    ARGV =
    ARGN =
After calling modify_dice(): CH09_FUN_LST_DICE = 6;5;4;3;2;1

[Function | current()]
  Arguments:
    ARGC = 0
    ARGV =
    ARGN =
  CMAKE_CURRENT_FUNCTION: current
  CMAKE_CURRENT_LIST_DIR: /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter09/cmake
  CMAKE_CURRENT_FUNCTION_LIST_FILE: /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter09/cmake/functions.cmake
  CMAKE_CURRENT_FUNCTION_LIST_LINE: 105

[Function | outer_function()]
  Arguments:
    ARGC = 3
    ARGV = a;b;c;1;2;3;x;y;z
    ARGN = a;b;c;1;2;3;x;y;z
[i]: Setting ARGS to
  Forwarding arguments:  [==[a;b;c]==] [==[1;2;3]==] [==[x;y;z]==]

[Function | inner_function()]
  Arguments:
    ARGC = 3
    ARGV = a;b;c;1;2;3;x;y;z
    ARGN = a;b;c;1;2;3;x;y;z

*--------*
| MACROS |
*--------*

[Macro | PRINT_HELLO_WORLD()]
  Arguments:
    ARGC = 0
    ARGV =
    ARGN =
  Hello, World!

[Macro | PRINT_HELLO(SUBJECT)]
  Arguments:
    ARGC = 1
    ARGV = CMake
    ARGN =
  Hello, CMake!

[Macro | LOG(LEVEL MESSAGE)]
  Arguments:
    ARGC = 2
    ARGV = ERROR;Something went wrong!
    ARGN =
  [ERROR] | Something went wrong!

[Macro | LOG(LEVEL MESSAGE)]
  Arguments:
    ARGC = 3
    ARGV = ERROR;Some other thing went wrong!;Some extra information.
    ARGN = Some extra information.
  [ERROR] | Some other thing went wrong!
  [EXTRA] | Some extra information.

[Macro | shop()]
  Arguments:
    ARGC = 7
    ARGV = NOW;PAY_WITH;debit card;THINGS;apple;banana;cherry
    ARGN = NOW;PAY_WITH;debit card;THINGS;apple;banana;cherry
[i]: Setting NO_VALUE_ARGS to NOW
[i]: Setting ONE_VALUE_ARGS to PAY_WITH
[i]: Setting MULTI_VALUE_ARGS to THINGS
  Going shopping now!
  Paying with: debit card
  Buying things:
    - apple
    - banana
    - cherry

[Macro | shop()]
  Arguments:
    ARGC = 6
    ARGV = PAY_WITH;credit card;THINGS;grapes;kiwi;lemon
    ARGN = PAY_WITH;credit card;THINGS;grapes;kiwi;lemon
[i]: Setting NO_VALUE_ARGS to NOW
[i]: Setting ONE_VALUE_ARGS to PAY_WITH
[i]: Setting MULTI_VALUE_ARGS to THINGS
  Going shopping later!
  Paying with: credit card
  Buying things:
    - grapes
    - kiwi
    - lemon
[i]: Setting CH09_MAC_VAR to value

[Macro | PRINT_VARIABLE(VARIABLE)]
  Arguments:
    ARGC = 1
    ARGV = CH09_MAC_VAR
    ARGN =
  VARIABLE: value

Before calling CREATE_DICE(): CH09_MAC_LST_DICE =
[Macro | create_dice(LST_DICE)]
  Arguments:
    ARGC = 1
    ARGV = CH09_MAC_LST_DICE
    ARGN =
[i]: Setting CH09_MAC_LST_DICE to 1;2;3;4;5;6
After calling CREATE_DICE(): CH09_MAC_LST_DICE = 1;2;3;4;5;6

Before calling modify_dice(): CH09_MAC_LST_DICE = 1;2;3;4;5;6
[Macro | modify_dice()]
  Arguments:
    ARGC = 0
    ARGV =
    ARGN =
[i]: Setting CH09_MAC_LST_DICE to 6;5;4;3;2;1
After calling MODIFY_DICE(): CH09_MAC_LST_DICE = 6;5;4;3;2;1

[Macro | outer_macro()]
  Arguments:
    ARGC = 3
    ARGV = a;b;c;1;2;3;x;y;z
    ARGN = a;b;c;1;2;3;x;y;z
  Forwarding arguments: [==[a]==] [==[b]==] [==[c]==] [==[1]==] [==[2]==] [==[3]==] [==[x]==] [==[y]==] [==[z]==]

[Macro | inner_macro()]
  Arguments:
    ARGC = 9
    ARGV = a;b;c;1;2;3;x;y;z
    ARGN = a;b;c;1;2;3;x;y;z
[i]: Setting code_text to   message("  Hello, ${SUBJECT}!")

Before calling call_set(): CH09_CALL_SET =
[Invoke | cmake_language(CALL set)]
  Arguments:
    ARGC = 2
    ARGV = CH09_CALL_SET;value
    ARGN =
[i]: Setting CH09_CALL_SET to value
After calling call_set(): CH09_CALL_SET = value

[Function | print_eval(SUBJECT)]
  Arguments:
    ARGC = 1
    ARGV = CMake
    ARGN =
  Evaluating code block:
    message("  Hello, ${SUBJECT}!")
  Hello, CMake!

[Invoke | cmake_language(DEFER CALL)]
    This will run as the last command in this file.

[Invoke | cmake_language(DEFER DIRECTORY CALL)]
    This will run as the last command in the top-level CMakeLists.txt.
```

### Tips

- Print arguments and special variables to understand their values.
- Try different argument combinations to see how they are handled.
- User `cmake_parse_arguments()` for keyword-based argument handling.
- Use `return(PROPAGATE ...)` to return values from functions (CMake 3.25+).
- Use `PARENT_SCOPE` to return values from functions (pre-CMake 3.25).
- Use `cmake_language()` and `cmake_language(DEFER)` to invoke CMake code.
- Follow the recommended practices for functions and macros.
- If stuck, refer to the examples provided in the chapter.
