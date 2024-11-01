# 📖 Chapter 11: Generator Expressions

This is an overview of Chapter 11, covering the key concepts of generator expressions in CMake. It includes various commands and best practices for working with generator expressions in CMake.

### Introduction to Generator Expressions

- Evaluated during generation phase, not configuration phase
- Allow for configuration-specific logic
- Syntax: `$<...>`
- Used in many commands and properties

### Simple Boolean Logic

**Basic expressions:**

- `$<1:...>`: True, includes content
- `$<0:...>`: False, excludes content
- `$<BOOL:...>`: Evaluates to 0 or 1

**Logical operations:**

- `$<AND:expr[,expr...]>`
- `$<OR:expr[,expr...]>`
- `$<NOT:expr>`

**Conditional:**

- `$<IF:expr,val1,val0>` (CMake 3.8+)

**Comparison:**

- `$<STREQUAL:string1,string2>`
- `$<EQUAL:number1,number2>`
- `$<VERSION_EQUAL:version1,version2>`
- `$<VERSION_GREATER:version1,version2>`
- `$<VERSION_LESS:version1,version2>`

**Build type:**

- `$<CONFIG:arg>`

### Target Details

**Target properties:**
- `$<TARGET_PROPERTY:target,property>`
- `$<TARGET_PROPERTY:property>`

**Target file information:**
- `$<TARGET_FILE:...>`
- `$<TARGET_FILE_NAME:...>`
- `$<TARGET_FILE_DIR:...>`

**Object libraries:**
- `$<TARGET_OBJECTS:...>`

### General Information

- `$<CONFIG>`: Build type
- `$<PLATFORM_ID>`: Target platform
- `$<C_COMPILER_VERSION>`, `$<CXX_COMPILER_VERSION>`: Compiler versions

### Path Expressions (CMake 3.24+)

- `$<PATH_EQUAL:path1,path2>`
- `$<PATH:subcommand,...>`

### List Expressions

**CMake 3.27+:**

- `$<LIST:...>` family of expressions

**Earlier versions:**

- `$<JOIN:list,...>`
- `$<REMOVE_DUPLICATES:list>` (CMake 3.15+)
- `$<FILTER:list,INCLUDE|EXCLUDE,regex>` (CMake 3.15+)

### Utility Expressions

- `$<COMMA>`: Inserts a comma
- `$<SEMICOLON>`: Inserts a semicolon
- `$<QUOTE>`: Inserts a double-quote (CMake 3.30+)
- `$<LOWER_CASE:...>`, `$<UPPER_CASE:...>`: Case conversion
- `$<GENEX_EVAL:...>`, `$<TARGET_GENEX_EVAL:target,...>`: Nested evaluation (CMake 3.13+)

### Recommended Practices

1. Familiarize yourself with generator expressions for robust, generator-agnostic logic
2. Use generator expressions for build type-specific logic
3. Prefer generator expressions over older methods for conditional logic
4. Use generator expressions judiciously to maintain readability
5. Avoid overly complex generator expressions
6. Consider CMake's built-in facilities before using complex generator expressions
7. Use `$<LIST:...>` expressions over older list-handling expressions when possible (CMake 3.27+)
8. Be aware of quoting requirements, especially with `$<JOIN:...>`
9. Use `$<CONFIG>` instead of `CMAKE_BUILD_TYPE` for build type checks
10. Leverage target-specific expressions like `$<TARGET_FILE:...>` for robust file paths

> **Remark:** Lookup the [official documentation](https://cmake.org/cmake/help/latest/manual/cmake-generator-expressions.7.html) for available generator expressions and their usage.

### Common Use Cases

1. **Conditional linking:**
   ```cmake
   target_link_libraries(MyApp PRIVATE $<$<CONFIG:Debug>:DebugLib>)
   ```

2. **Platform-specific compile definitions:**
   ```cmake
   target_compile_definitions(MyApp PRIVATE $<$<PLATFORM_ID:Windows>:WIN32_LEAN_AND_MEAN>)
   ```

3. **Compiler-specific flags:**
   ```cmake
   target_compile_options(MyApp PRIVATE $<$<CXX_COMPILER_ID:MSVC>:/W4>)
   ```

4. **Conditional source files:**
   ```cmake
   target_sources(MyApp PRIVATE $<$<PLATFORM_ID:Windows>:win_specific.cpp>)
   ```

5. **Custom commands with target file paths:**
   ```cmake
   add_custom_command(
     TARGET MyApp POST_BUILD
     COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:MyApp> ${OUTPUT_DIR}
   )
   ```

# 🎯 Workshop

In this workshop, you will practice working with generator expressions in CMake. You will define and use generator expressions in various commands and properties to control project behavior based on build configuration and platform.

### Objectives

- Use generator expressions to conditionally set properties and commands
- Explore the use of generator expressions for platform-specific logic
- Practice using generator expressions for target-specific settings
- Implement conditional logic based on build type

#### Example output

```plaintext
[Genex | 0]
  Expression: $<0:This will not be printed>
  Result:

[Genex | 1]
  Expression: $<1:This will be printed>
  Result: This will be printed

[Genex | BOOL : FALSE]
  Expression: $<$<BOOL:FALSE>:This will not be printed>
  Result:

[Genex | BOOL : TRUE]
  Expression: $<$<BOOL:TRUE>:This will be printed>
  Result: This will be printed

[Genex | LOGIC : 0]
  Expression: $<$<AND:$<BOOL:TRUE>,$<BOOL:FALSE>>:This will not be printed>
  Result:

[Genex | LOGIC : 1]
  Expression: $<$<OR:$<BOOL:TRUE>,$<BOOL:FALSE>>:This will be printed>
  Result: This will be printed

[Genex | IF : 0]
  Expression: $<IF:0,true,false>
  Result: false

[Genex | IF : 1]
  Expression: $<IF:1,true,false>
  Result: true

[Genex | NUMBER : EQUAL : 0]
  Expression: $<IF:$<EQUAL:3,10>,Numbers are equal,Numbers are not equal>
  Result: Numbers are not equal

[Genex | NUMBER : EQUAL : 1]
  Expression: $<IF:$<EQUAL:10,10>,Numbers are equal,Numbers are not equal>
  Result: Numbers are equal

[Genex | STRING : EQUAL : 0]
  Expression: $<IF:$<STREQUAL:STR,NOSTR>,Strings are equal,Strings are not equal>
  Result: Strings are not equal

[Genex | STRING : EQUAL : 1]
  Expression: $<IF:$<STREQUAL:STR,STR>,Strings are equal,Strings are not equal>
  Result: Strings are equal

[Genex | VERSION : EQUAL : 0]
  Expression: $<IF:$<VERSION_EQUAL:3.0.1,9.0.2>,Versions are equal,Versions are not equal>
  Result: Versions are not equal

[Genex | VERSION : EQUAL : 1]
  Expression: $<IF:$<VERSION_EQUAL:9.0.2,9.0.2>,Versions are equal,Versions are not equal>
  Result: Versions are equal

[Genex | CONFIG : Debug]
  Expression: $<IF:$<CONFIG:Debug>,Config is 'Debug',Config is not 'Debug'>
  Result: Config is not 'Debug'

[Genex | LIST : 0]
  Expression: $<IN_LIST:X,A;B;C>
  Result: 0

[Genex | LIST : 1]
  Expression: $<IN_LIST:A,${CH11_LIST}>
  Result: 1

[Genex | LIST : APPEND]
  Expression: $<LIST:APPEND,A;B;C,D>
  Result: A;B;C;D

[Target : Chapter11]
  Binary name: Chapter11-1.0.0
  Binary dir : /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter11/build/projects/Chapter11
  Binary path: /Users/Emrecan/Developer/Repositories/github.com/EmrecanKaracayir/LearnCMake/Chapter11/build/projects/Chapter11/Chapter11-1.0.0
```

### Tips

- Use `add_custom_target()` to debug generator expressions (See [examples](cmake/genexes.cmake)).
- Experiment with different generator expressions to understand their behavior.
- Check the [official documentation](https://cmake.org/cmake/help/latest/manual/cmake-generator-expressions.7.html) for more generator expressions.
