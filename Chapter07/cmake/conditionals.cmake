# TITLE
message("\n*--------------*")
message("| CONDITIONALS |")
message("*--------------*")

# Basic if statements
message("\n[Basic if statements]")
set(condition TRUE)
message("  condition: ${condition}")

if(condition)
  message("  Condition is TRUE")
else()
  message("  Condition is FALSE")
endif()

# Logical operators
message("\n[Logical operators]")
set(condition1 TRUE)
message("  condition1: ${condition1}")
set(condition2 FALSE)
message("  condition2: ${condition2}")

if(condition1 AND condition2)
  message("  Condition 1 AND Condition 2 is TRUE")
else()
  message("  Condition 1 AND Condition 2 is FALSE")
endif()

if(condition1 OR condition2)
  message("  Condition 1 OR Condition 2 is TRUE")
else()
  message("  Condition 1 OR Condition 2 is FALSE")
endif()

if(NOT condition1)
  message("  NOT Condition 1 is TRUE")
else()
  message("  NOT Condition 1 is FALSE")
endif()

# Numeric comparisons
message("\n[Numeric comparisons]")
set(number1 10)
message("  number1: ${number1}")
set(number2 5)
message("  number2: ${number2}")

if(number1 EQUAL number2)
  message("  Number 1 EQUAL Number 2")
else()
  message("  Number 1 NOT EQUAL Number 2")
endif()

if(number1 LESS number2)
  message("  Number 1 LESS THAN Number 2")
else()
  message("  Number 1 NOT LESS THAN Number 2")
endif()

if(number1 GREATER number2)
  message("  Number 1 GREATER THAN Number 2")
else()
  message("  Number 1 NOT GREATER THAN Number 2")
endif()

if(number1 LESS_EQUAL number2)
  message("  Number 1 LESS THAN OR EQUAL TO Number 2")
else()
  message("  Number 1 NOT LESS THAN OR EQUAL TO Number 2")
endif()

if(number1 GREATER_EQUAL number2)
  message("  Number 1 GREATER THAN OR EQUAL TO Number 2")
else()
  message("  Number 1 NOT GREATER THAN OR EQUAL TO Number 2")
endif()

# String comparisons
message("\n[String comparisons]")
set(string1 "value")
message("  string1: ${string1}")
set(string2 "value")
message("  string2: ${string2}")

if(string1 STREQUAL string2)
  message("  String 1 EQUAL String 2")
else()
  message("  String 1 NOT EQUAL String 2")
endif()

if(string1 STRLESS string2)
  message("  String 1 LESS THAN String 2")
else()
  message("  String 1 NOT LESS THAN String 2")
endif()

if(string1 STRGREATER string2)
  message("  String 1 GREATER THAN String 2")
else()
  message("  String 1 NOT GREATER THAN String 2")
endif()

if(string1 STRLESS_EQUAL string2)
  message("  String 1 LESS THAN OR EQUAL TO String 2")
else()
  message("  String 1 NOT LESS THAN OR EQUAL TO String 2")
endif()

if(string1 STRGREATER_EQUAL string2)
  message("  String 1 GREATER THAN OR EQUAL TO String 2")
else()
  message("  String 1 NOT GREATER THAN OR EQUAL TO String 2")
endif()

# Version comparisons
message("\n[Version comparisons]")
set(version1 1.0.0)
message("  CH07_VAR_VERSION1: ${version1}")
set(version2 1.2.0)
message("  CH07_VAR_VERSION2: ${version2}")

if(version1 VERSION_EQUAL version2)
  message("  Version 1 EQUAL Version 2")
else()
  message("  Version 1 NOT EQUAL Version 2")
endif()


if(version1 VERSION_LESS version2)
  message("  Version 1 LESS THAN Version 2")
else()
  message("  Version 1 NOT LESS THAN Version 2")
endif()

if(version1 VERSION_GREATER version2)
  message("  Version 1 GREATER THAN Version 2")
else()
  message("  Version 1 NOT GREATER THAN Version 2")
endif()

if(version1 VERSION_LESS_EQUAL version2)
  message("  Version 1 LESS THAN OR EQUAL TO Version 2")
else()
  message("  Version 1 NOT LESS THAN OR EQUAL TO Version 2")
endif()

if(version1 VERSION_GREATER_EQUAL version2)
  message("  Version 1 GREATER THAN OR EQUAL TO Version 2")
else()
  message("  Version 1 NOT GREATER THAN OR EQUAL TO Version 2")
endif()

# Path comparisons
message("\n[Path comparisons]")
set(path1 "/path/to/file1")
message("  path1: ${path1}")
set(path2 "/path/to/file2")
message("  path2: ${path2}")

if(path1 PATH_EQUAL path2)
  message("  Path 1 EQUAL Path 2")
else()
  message("  Path 1 NOT EQUAL Path 2")
endif()

# Regex comparisons
message("\n[Regex comparisons]")
set(regex1 "value1")
message("  regex1: ${regex1}")
set(regex2 "value2")
message("  regex2: ${regex2}")

if(regex1 MATCHES "value[0-9]")
  message("  Regex 1 MATCHES \"value[0-9]\": ${CMAKE_MATCH_0}")
else()
  message("  Regex 1 DOES NOT MATCH \"value[0-9]\": ${CMAKE_MATCH_0}")
endif()

if(regex2 MATCHES "value[A-Z]")
  message("  Regex 2 MATCHES \"value[A-Z]\": ${CMAKE_MATCH_0}")
else()
  message("  Regex 2 DOES NOT MATCH \"value[A-Z]\": ${CMAKE_MATCH_0}")
endif()

# File system tests
message("\n[File system tests]")
set(file "${SChapter07_SOURCE_DIR}/CMakeLists.txt")
message("  file: ${file}")
set(folder "cmake")
message("  folder: ${folder}")

if(EXISTS "${file}")
  message("  File EXISTS")
else()
  message("  File DOES NOT EXIST")
endif()

if(EXISTS "${folder}")
  message("  Folder EXISTS")
else()
  message("  Folder DOES NOT EXIST")
endif()

if(IS_READABLE "${file}")
  message("  File IS READABLE")
else()
  message("  File IS NOT READABLE")
endif()

if(IS_READABLE "${folder}")
  message("  Folder IS READABLE")
else()
  message("  Folder IS NOT READABLE")
endif()

if(IS_WRITABLE "${file}")
  message("  File IS WRITABLE")
else()
  message("  File IS NOT WRITABLE")
endif()

if(IS_WRITABLE "${folder}")
  message("  Folder IS WRITABLE")
else()
  message("  Folder IS NOT WRITABLE")
endif()

if(IS_EXECUTABLE "${file}")
  message("  File IS EXECUTABLE")
else()
  message("  File IS NOT EXECUTABLE")
endif()

if(IS_EXECUTABLE "${folder}")
  message("  Folder IS EXECUTABLE")
else()
  message("  Folder IS NOT EXECUTABLE")
endif()

if(IS_DIRECTORY "${file}")
  message("  File IS A DIRECTORY")
else()
  message("  File IS NOT A DIRECTORY")
endif()

if(IS_DIRECTORY "${folder}")
  message("  Folder IS A DIRECTORY")
else()
  message("  Folder IS NOT A DIRECTORY")
endif()

if(IS_SYMLINK "${file}")
  message("  File IS A SYMLINK")
else()
  message("  File IS NOT A SYMLINK")
endif()

if(IS_SYMLINK "${folder}")
  message("  Folder IS A SYMLINK")
else()
  message("  Folder IS NOT A SYMLINK")
endif()

if(IS_ABSOLUTE "${file}")
  message("  File IS ABSOLUTE")
else()
  message("  File IS NOT ABSOLUTE")
endif()

if(IS_ABSOLUTE "${folder}")
  message("  Folder IS ABSOLUTE")
else()
  message("  Folder IS NOT ABSOLUTE")
endif()

if("${file}" IS_NEWER_THAN "${folder}")
  message("  File IS NEWER THAN Folder")
else()
  message("  File IS NOT NEWER THAN Folder")
endif()

# Existance tests
message("\n[Existance tests]")
set(exist1 "value")
message("  exist1: ${exist1}")
message("  exist2: ${exist2}")

if(DEFINED exist1)
  message("  Exist 1 IS DEFINED")
else()
  message("  Exist 1 IS NOT DEFINED")
endif()

if(DEFINED exist2)
  message("  Exist 2 IS DEFINED")
else()
  message("  Exist 2 IS NOT DEFINED")
endif()

if(COMMAND exist1)
  message("  Exist 1 IS A COMMAND")
else()
  message("  Exist 1 IS NOT A COMMAND")
endif()

if(POLICY CMP0000)
  message("  Policy CMP0000 EXISTS")
else()
  message("  Policy CMP0000 DOES NOT EXIST")
endif()

if(TARGET exist1)
  message("  Exist 1 IS A TARGET")
else()
  message("  Exist 1 IS NOT A TARGET")
endif()

if(TEST exist1)
  message("  Exist 1 IS A TEST")
else()
  message("  Exist 1 IS NOT A TEST")
endif()

set(list "value" "value1" "value2")
if (exist1 IN_LIST list)
  message("  Exist 1 IS IN LIST: ${list}")
else()
  message("  Exist 1 IS NOT IN LIST: ${list}")
endif()

if ("notValue" IN_LIST list)
  message("  \"notValue\" IS IN LIST: ${list}")
else()
  message("  \"notValue\" IS NOT IN LIST: ${list}")
endif()

# Some examples
message("\n[Some examples]")

if(CMAKE_HOST_WIN32)
  message("  Running on Windows")
else()
  message("  Not running on Windows")
endif()

if(CMAKE_HOST_APPLE)
  message("  Running on macOS")
else()
  message("  Not running on macOS")
endif()

if(CMAKE_HOST_UNIX)
  message("  Running on Unix")
else()
  message("  Not running on Unix")
endif()

if(CMAKE_VERSION VERSION_LESS "3.0")
  message("  CMake version is less than 3.0")
else()
  message("  CMake version is not less than 3.0")
endif()

option(option "Option" TRUE)

if(option)
  message("  Option is TRUE")
else()
  message("  Option is FALSE")
endif()
