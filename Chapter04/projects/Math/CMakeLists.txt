# >----------< PROJECT : Math >------------------------------------------------------------------< #

project(PMath VERSION ${SChapter04_VERSION} LANGUAGES CXX)

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
