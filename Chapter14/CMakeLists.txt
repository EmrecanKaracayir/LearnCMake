# >----------< CMAKE >---------------------------------------------------------------------------< #

cmake_minimum_required(VERSION 3.30)

# >----------< SOLUTION : Chapter14 >------------------------------------------------------------< #

list(APPEND CMAKE_MESSAGE_CONTEXT "SChapter14")

project(SChapter14 VERSION 1.0.0 LANGUAGES CXX)

# >----------< INCLUDES >------------------------------------------------------------------------< #

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(FnPrint)
include(Language)
include(LogLevels)
include(Indenting)
include(Checks)
include(VariableWatch)
include(DebugGenex)

# >----------< PROJECTS >------------------------------------------------------------------------< #

# Chapter14 -> {}
add_subdirectory("projects/Chapter14")

# >----------< CALLS >---------------------------------------------------------------------------< #

fnPrint(
  FOREGROUND MAGENTA
  MESSAGE "[>]: This is a system message."
)

fnPrint(
  FOREGROUND RED
  MESSAGE "[x]: This is a failure message!"
)

fnPrint(
  FOREGROUND YELLOW
  MESSAGE "[!]: This is a warning message."
)

fnPrint(
  FOREGROUND GREEN
  MESSAGE "[+]: This is a success message."
)

fnPrint(
  FOREGROUND CYAN
  MESSAGE "[~]: This is a progress message..."
)

fnPrint(
  FOREGROUND BLUE
  MESSAGE "[i]: This is an information message."
)

fnPrint(
  MESSAGE "[=]: This is a default message."
)

fnPrint(
  STYLES DIM
  MESSAGE "[-]: This is a dimmed message."
)

set(someVariable "This is a variable.")
set(someOtherVariable "This is another variable.")

fnPrintVariables(WITH_CONTEXT someVariable someOtherVariable)
