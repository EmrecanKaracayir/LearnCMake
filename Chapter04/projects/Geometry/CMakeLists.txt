# >----------< PROJECT : Geometry >--------------------------------------------------------------< #

project(PGeometry VERSION ${SChapter04_VERSION} LANGUAGES CXX)

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
