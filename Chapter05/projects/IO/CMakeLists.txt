# >----------< PROJECT : IO >--------------------------------------------------------------------< #

project(PRJ_IO)

# >----------< TARGET : IO >---------------------------------------------------------------------< #

add_library(
  IO
  INTERFACE
  "include/IO/input.hpp"
  "include/IO/output.hpp"
)

target_include_directories(IO INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/include")

# >----------< TESTS >---------------------------------------------------------------------------< #

if (UNIX)

  # Passing test
  add_test(
    NAME PassingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/IO/passing.fish"
  )

  # Failing test
  add_test(
    NAME FailingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/IO/failing.fish"
  )

else ()

  # Passing test
  add_test(
    NAME PassingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/IO/passing.ps1"
  )

  # Failing test
  add_test(
    NAME FailingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/IO/failing.ps1"
  )

endif (UNIX)
