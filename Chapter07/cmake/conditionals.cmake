# TITLE
message("\n*--------------*")
message("| CONDITIONALS |")
message("*--------------*")

# Basic if statements
message("\n[Basic if statements]")
set(CH07_VAR_CONDITION TRUE)
message("  CH07_VAR_CONDITION: ${CH07_VAR_CONDITION}")

if(CH07_VAR_CONDITION)
  message("  Condition is TRUE")
else()
  message("  Condition is FALSE")
endif()

# Logical operators
message("\n[Logical operators]")
set(CH07_VAR_CONDITION1 TRUE)
message("  CH07_VAR_CONDITION1: ${CH07_VAR_CONDITION1}")
set(CH07_VAR_CONDITION2 FALSE)
message("  CH07_VAR_CONDITION2: ${CH07_VAR_CONDITION2}")

if(CH07_VAR_CONDITION1 AND CH07_VAR_CONDITION2)
  message("  Condition 1 AND Condition 2 is TRUE")
else()
  message("  Condition 1 AND Condition 2 is FALSE")
endif()

if(CH07_VAR_CONDITION1 OR CH07_VAR_CONDITION2)
  message("  Condition 1 OR Condition 2 is TRUE")
else()
  message("  Condition 1 OR Condition 2 is FALSE")
endif()

if(NOT CH07_VAR_CONDITION1)
  message("  NOT Condition 1 is TRUE")
else()
  message("  NOT Condition 1 is FALSE")
endif()

# Numeric comparisons
message("\n[Numeric comparisons]")
set(CH07_VAR_NUMBER1 10)
message("  CH07_VAR_NUMBER1: ${CH07_VAR_NUMBER1}")
set(CH07_VAR_NUMBER2 5)
message("  CH07_VAR_NUMBER2: ${CH07_VAR_NUMBER2}")

if(CH07_VAR_NUMBER1 EQUAL CH07_VAR_NUMBER2)
  message("  Number 1 EQUAL Number 2")
else()
  message("  Number 1 NOT EQUAL Number 2")
endif()

if(CH07_VAR_NUMBER1 LESS CH07_VAR_NUMBER2)
  message("  Number 1 LESS THAN Number 2")
else()
  message("  Number 1 NOT LESS THAN Number 2")
endif()

if(CH07_VAR_NUMBER1 GREATER CH07_VAR_NUMBER2)
  message("  Number 1 GREATER THAN Number 2")
else()
  message("  Number 1 NOT GREATER THAN Number 2")
endif()

if(CH07_VAR_NUMBER1 LESS_EQUAL CH07_VAR_NUMBER2)
  message("  Number 1 LESS THAN OR EQUAL TO Number 2")
else()
  message("  Number 1 NOT LESS THAN OR EQUAL TO Number 2")
endif()

if(CH07_VAR_NUMBER1 GREATER_EQUAL CH07_VAR_NUMBER2)
  message("  Number 1 GREATER THAN OR EQUAL TO Number 2")
else()
  message("  Number 1 NOT GREATER THAN OR EQUAL TO Number 2")
endif()

# String comparisons
message("\n[String comparisons]")
set(CH07_VAR_STRING1 "value")
message("  CH07_VAR_STRING1: ${CH07_VAR_STRING1}")
set(CH07_VAR_STRING2 "value")
message("  CH07_VAR_STRING2: ${CH07_VAR_STRING2}")

if(CH07_VAR_STRING1 STREQUAL CH07_VAR_STRING2)
  message("  String 1 EQUAL String 2")
else()
  message("  String 1 NOT EQUAL String 2")
endif()

if(CH07_VAR_STRING1 STRLESS CH07_VAR_STRING2)
  message("  String 1 LESS THAN String 2")
else()
  message("  String 1 NOT LESS THAN String 2")
endif()

if(CH07_VAR_STRING1 STRGREATER CH07_VAR_STRING2)
  message("  String 1 GREATER THAN String 2")
else()
  message("  String 1 NOT GREATER THAN String 2")
endif()

if(CH07_VAR_STRING1 STRLESS_EQUAL CH07_VAR_STRING2)
  message("  String 1 LESS THAN OR EQUAL TO String 2")
else()
  message("  String 1 NOT LESS THAN OR EQUAL TO String 2")
endif()

if(CH07_VAR_STRING1 STRGREATER_EQUAL CH07_VAR_STRING2)
  message("  String 1 GREATER THAN OR EQUAL TO String 2")
else()
  message("  String 1 NOT GREATER THAN OR EQUAL TO String 2")
endif()

# Version comparisons
message("\n[Version comparisons]")
set(CH07_VAR_VERSION1 1.0.0)
message("  CH07_VAR_VERSION1: ${CH07_VAR_VERSION1}")
set(CH07_VAR_VERSION2 1.2.0)
message("  CH07_VAR_VERSION2: ${CH07_VAR_VERSION2}")

if(CH07_VAR_VERSION1 VERSION_EQUAL CH07_VAR_VERSION2)
  message("  Version 1 EQUAL Version 2")
else()
  message("  Version 1 NOT EQUAL Version 2")
endif()


if(CH07_VAR_VERSION1 VERSION_LESS CH07_VAR_VERSION2)
  message("  Version 1 LESS THAN Version 2")
else()
  message("  Version 1 NOT LESS THAN Version 2")
endif()

if(CH07_VAR_VERSION1 VERSION_GREATER CH07_VAR_VERSION2)
  message("  Version 1 GREATER THAN Version 2")
else()
  message("  Version 1 NOT GREATER THAN Version 2")
endif()

if(CH07_VAR_VERSION1 VERSION_LESS_EQUAL CH07_VAR_VERSION2)
  message("  Version 1 LESS THAN OR EQUAL TO Version 2")
else()
  message("  Version 1 NOT LESS THAN OR EQUAL TO Version 2")
endif()

if(CH07_VAR_VERSION1 VERSION_GREATER_EQUAL CH07_VAR_VERSION2)
  message("  Version 1 GREATER THAN OR EQUAL TO Version 2")
else()
  message("  Version 1 NOT GREATER THAN OR EQUAL TO Version 2")
endif()

# Path comparisons
message("\n[Path comparisons]")
set(CH07_VAR_PATH1 "/path/to/file1")
message("  CH07_VAR_PATH1: ${CH07_VAR_PATH1}")
set(CH07_VAR_PATH2 "/path/to/file2")
message("  CH07_VAR_PATH2: ${CH07_VAR_PATH2}")

if(CH07_VAR_PATH1 PATH_EQUAL CH07_VAR_PATH2)
  message("  Path 1 EQUAL Path 2")
else()
  message("  Path 1 NOT EQUAL Path 2")
endif()

# Regex comparisons
message("\n[Regex comparisons]")
set(CH07_VAR_REGEX1 "value1")
message("  CH07_VAR_REGEX1: ${CH07_VAR_REGEX1}")
set(CH07_VAR_REGEX2 "value2")
message("  CH07_VAR_REGEX2: ${CH07_VAR_REGEX2}")

if(CH07_VAR_REGEX1 MATCHES "value[0-9]")
  message("  Regex 1 MATCHES \"value[0-9]\": ${CMAKE_MATCH_0}")
else()
  message("  Regex 1 DOES NOT MATCH \"value[0-9]\": ${CMAKE_MATCH_0}")
endif()

if(CH07_VAR_REGEX2 MATCHES "value[A-Z]")
  message("  Regex 2 MATCHES \"value[A-Z]\": ${CMAKE_MATCH_0}")
else()
  message("  Regex 2 DOES NOT MATCH \"value[A-Z]\": ${CMAKE_MATCH_0}")
endif()

# File system tests
message("\n[File system tests]")
set(CH07_VAR_FILE1 "${CMAKE_SOURCE_DIR}/CMakeLists.txt")
message("  CH07_VAR_FILE1: ${CH07_VAR_FILE1}")
set(CH07_VAR_FILE2 "cmake")
message("  CH07_VAR_FILE2: ${CH07_VAR_FILE2}")

if(EXISTS "${CH07_VAR_FILE1}")
  message("  File 1 EXISTS")
else()
  message("  File 1 DOES NOT EXIST")
endif()

if(EXISTS "${CH07_VAR_FILE2}")
  message("  File 2 EXISTS")
else()
  message("  File 2 DOES NOT EXIST")
endif()

if(IS_READABLE "${CH07_VAR_FILE1}")
  message("  File 1 IS READABLE")
else()
  message("  File 1 IS NOT READABLE")
endif()

if(IS_READABLE "${CH07_VAR_FILE2}")
  message("  File 2 IS READABLE")
else()
  message("  File 2 IS NOT READABLE")
endif()

if(IS_WRITABLE "${CH07_VAR_FILE1}")
  message("  File 1 IS WRITABLE")
else()
  message("  File 1 IS NOT WRITABLE")
endif()

if(IS_WRITABLE "${CH07_VAR_FILE2}")
  message("  File 2 IS WRITABLE")
else()
  message("  File 2 IS NOT WRITABLE")
endif()

if(IS_EXECUTABLE "${CH07_VAR_FILE1}")
  message("  File 1 IS EXECUTABLE")
else()
  message("  File 1 IS NOT EXECUTABLE")
endif()

if(IS_EXECUTABLE "${CH07_VAR_FILE2}")
  message("  File 2 IS EXECUTABLE")
else()
  message("  File 2 IS NOT EXECUTABLE")
endif()

if(IS_DIRECTORY "${CH07_VAR_FILE1}")
  message("  File 1 IS A DIRECTORY")
else()
  message("  File 1 IS NOT A DIRECTORY")
endif()

if(IS_DIRECTORY "${CH07_VAR_FILE2}")
  message("  File 2 IS A DIRECTORY")
else()
  message("  File 2 IS NOT A DIRECTORY")
endif()

if(IS_SYMLINK "${CH07_VAR_FILE1}")
  message("  File 1 IS A SYMLINK")
else()
  message("  File 1 IS NOT A SYMLINK")
endif()

if(IS_SYMLINK "${CH07_VAR_FILE2}")
  message("  File 2 IS A SYMLINK")
else()
  message("  File 2 IS NOT A SYMLINK")
endif()

if(IS_ABSOLUTE "${CH07_VAR_FILE1}")
  message("  File 1 IS ABSOLUTE")
else()
  message("  File 1 IS NOT ABSOLUTE")
endif()

if(IS_ABSOLUTE "${CH07_VAR_FILE2}")
  message("  File 2 IS ABSOLUTE")
else()
  message("  File 2 IS NOT ABSOLUTE")
endif()

if("${CH07_VAR_FILE1}" IS_NEWER_THAN "${CH07_VAR_FILE2}")
  message("  File 1 IS NEWER THAN File 2")
else()
  message("  File 1 IS NOT NEWER THAN File 2")
endif()

# Existance tests
message("\n[Existance tests]")
set(CH07_VAR_EXIST1 "value")
message("  CH07_VAR_EXIST1: ${CH07_VAR_EXIST1}")
message("  CH07_VAR_EXIST2: ${CH07_VAR_EXIST2}")

if(DEFINED CH07_VAR_EXIST1)
  message("  Exist 1 IS DEFINED")
else()
  message("  Exist 1 IS NOT DEFINED")
endif()

if(DEFINED CH07_VAR_EXIST2)
  message("  Exist 2 IS DEFINED")
else()
  message("  Exist 2 IS NOT DEFINED")
endif()

if(COMMAND CH07_VAR_EXIST1)
  message("  Exist 1 IS A COMMAND")
else()
  message("  Exist 1 IS NOT A COMMAND")
endif()

if(POLICY CMP0000)
  message("  Policy CMP0000 EXISTS")
else()
  message("  Policy CMP0000 DOES NOT EXIST")
endif()

if(TARGET CH07_VAR_EXIST1)
  message("  Exist 1 IS A TARGET")
else()
  message("  Exist 1 IS NOT A TARGET")
endif()

if(TEST CH07_VAR_EXIST1)
  message("  Exist 1 IS A TEST")
else()
  message("  Exist 1 IS NOT A TEST")
endif()

set(CH07_VAR_LIST "value" "value1" "value2")
if (CH07_VAR_EXIST1 IN_LIST CH07_VAR_LIST)
  message("  Exist 1 IS IN LIST: ${CH07_VAR_LIST}")
else()
  message("  Exist 1 IS NOT IN LIST: ${CH07_VAR_LIST}")
endif()

if ("notValue" IN_LIST CH07_VAR_LIST)
  message("  \"notValue\" IS IN LIST: ${CH07_VAR_LIST}")
else()
  message("  \"notValue\" IS NOT IN LIST: ${CH07_VAR_LIST}")
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

option(CH07_VAR_OPTION "Option" TRUE)

if(CH07_VAR_OPTION)
  message("  Option is TRUE")
else()
  message("  Option is FALSE")
endif()