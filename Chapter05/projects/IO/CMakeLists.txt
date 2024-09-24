# >----------< PROJECT : IO >--------------------------------------------------------------------< #

project(PRJ_IO)

# >----------< TARGET : IO >---------------------------------------------------------------------< #

add_library(IO INTERFACE)

target_sources(
  IO
  INTERFACE
    FILE_SET api
    TYPE HEADERS
    BASE_DIRS "include"
    FILES
      "include/IO/input.hpp"
      "include/IO/output.hpp"
)

install(TARGETS IO FILE_SET api)

# >----------< TESTING >-------------------------------------------------------------------------< #

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
