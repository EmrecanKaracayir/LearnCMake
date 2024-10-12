# >----------< PROJECT : Math >------------------------------------------------------------------< #

project(PRJ_Math)

# >----------< Target : Math >-------------------------------------------------------------------< #

add_library(Math)

target_sources(
  Math
  PUBLIC
    FILE_SET api
    TYPE HEADERS
    BASE_DIRS "include"
    FILES
      "include/Math/addition.hpp"
      "include/Math/division.hpp"
      "include/Math/multiplication.hpp"
      "include/Math/subtraction.hpp"
  PRIVATE
    "source/Math/addition.cpp"
    "source/Math/division.cpp"
    "source/Math/multiplication.cpp"
    "source/Math/subtraction.cpp"
)

message("\n[Properties | TARGET : Math]")
set_target_properties(
  Math
  PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${SLN_Chapter10_BINARY_DIR}/out/bin"
    ARCHIVE_OUTPUT_DIRECTORY "${SLN_Chapter10_BINARY_DIR}/out/lib"
    LIBRARY_OUTPUT_DIRECTORY "${SLN_Chapter10_BINARY_DIR}/out/lib"
)
message("  Set output directories: ${SLN_Chapter10_BINARY_DIR}/out/{bin,lib}")

install(TARGETS Math FILE_SET api)

# >----------< INCLUDE >-------------------------------------------------------------------------< #

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/sources.cmake")

# >----------< TESTING >-------------------------------------------------------------------------< #

if(CMAKE_HOST_UNIX)
  # Passing test
  add_test(
    NAME PRJ_Math_PassingTest
    COMMAND "${SLN_Chapter10_SOURCE_DIR}/tests/Math/passing.fish"
  )

  # Failing test
  add_test(
    NAME PRJ_Math_FailingTest
    COMMAND "${SLN_Chapter10_SOURCE_DIR}/tests/Math/failing.fish"
  )
else()
  # Passing test
  add_test(
    NAME PRJ_Math_PassingTest
    COMMAND "${SLN_Chapter10_SOURCE_DIR}/tests/Math/passing.ps1"
  )

  # Failing test
  add_test(
    NAME PRJ_Math_FailingTest
    COMMAND "${SLN_Chapter10_SOURCE_DIR}/tests/Math/failing.ps1"
  )
endif()

message("\n[Properties | TEST : PRJ_Math_FailingTest]")
set_tests_properties(
  PRJ_Math_FailingTest
  PROPERTIES
    DISABLED TRUE
)
message("  Disable test: Math/FailingTest")
