# >----------< PROJECT : IO >--------------------------------------------------------------------< #

project(PIO VERSION ${SChapter05_VERSION} LANGUAGES CXX)

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

if(CMAKE_HOST_UNIX)
  # Passing test
  add_test(
    NAME PIO_TPassing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/IO/passing.fish"
  )
  # Failing test
  add_test(
    NAME PIO_TFailing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/IO/failing.fish"
  )
else()
  # Passing test
  add_test(
    NAME PIO_TPassing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/IO/passing.ps1"
  )
  # Failing test
  add_test(
    NAME PIO_TFailing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/IO/failing.ps1"
  )
endif()
