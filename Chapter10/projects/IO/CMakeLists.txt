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

message("\n[Properties | TARGET : IO]")
set_target_properties(
  IO
  PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${SLN_Chapter10_BINARY_DIR}/out/bin"
    ARCHIVE_OUTPUT_DIRECTORY "${SLN_Chapter10_BINARY_DIR}/out/lib"
    LIBRARY_OUTPUT_DIRECTORY "${SLN_Chapter10_BINARY_DIR}/out/lib"
)
message("  Set output directories: ${SLN_Chapter10_BINARY_DIR}/out/{bin,lib}")

install(TARGETS IO FILE_SET api)

# >----------< TESTING >-------------------------------------------------------------------------< #

if(CMAKE_HOST_UNIX)
  # Passing test
  add_test(
    NAME PRJ_IO_PassingTest
    COMMAND "${SLN_Chapter10_SOURCE_DIR}/tests/IO/passing.fish"
  )

  # Failing test
  add_test(
    NAME PRJ_IO_FailingTest
    COMMAND "${SLN_Chapter10_SOURCE_DIR}/tests/IO/failing.fish"
  )
else()
  # Passing test
  add_test(
    NAME PRJ_IO_PassingTest
    COMMAND "${SLN_Chapter10_SOURCE_DIR}/tests/IO/passing.ps1"
  )

  # Failing test
  add_test(
    NAME PRJ_IO_FailingTest
    COMMAND "${SLN_Chapter10_SOURCE_DIR}/tests/IO/failing.ps1"
  )
endif()
