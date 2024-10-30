# >----------< PROJECT : Geometry >--------------------------------------------------------------< #

project(PGeometry VERSION ${SChapter05_VERSION} LANGUAGES CXX)

# >----------< TARGET : Geometry >---------------------------------------------------------------< #

add_library(Geometry)

target_sources(
  Geometry
  PUBLIC
    FILE_SET api
    TYPE HEADERS
    BASE_DIRS "include"
    FILES
      "include/Geometry/Rectangle.hpp"
  PRIVATE
    "source/Geometry/Rectangle.cpp"
)

target_link_libraries(Geometry PRIVATE Math)

install(TARGETS Geometry FILE_SET api)

# >----------< TESTING >-------------------------------------------------------------------------< #

if(CMAKE_HOST_UNIX)
  # Passing test
  add_test(
    NAME PGeometry_TPassing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/Geometry/passing.fish"
  )
  # Failing test
  add_test(
    NAME PGeometry_TFailing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/Geometry/failing.fish"
  )
else()
  # Passing test
  add_test(
    NAME PGeometry_TPassing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/Geometry/passing.ps1"
  )
  # Failing test
  add_test(
    NAME PGeometry_TFailing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/Geometry/failing.ps1"
  )
endif()
