# >----------< PROJECT : Math >------------------------------------------------------------------< #

project(PMath VERSION ${SChapter05_VERSION} LANGUAGES CXX)

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

install(TARGETS Math FILE_SET api)

# >----------< TESTING >-------------------------------------------------------------------------< #

if(CMAKE_HOST_UNIX)
  # Passing test
  add_test(
    NAME PMath_TPassing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/Math/passing.fish"
  )
  # Failing test
  add_test(
    NAME PMath_TFailing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/Math/failing.fish"
  )
else()
  # Passing test
  add_test(
    NAME PMath_TPassing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/Math/passing.ps1"
  )
  # Failing test
  add_test(
    NAME PMath_TFailing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/Math/failing.ps1"
  )
endif()
