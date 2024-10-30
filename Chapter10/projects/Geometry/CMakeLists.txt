# >----------< PROJECT : Geometry >--------------------------------------------------------------< #

project(PGeometry VERSION ${SChapter10_VERSION} LANGUAGES CXX)

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

message("\n[Properties | TARGET : Geometry]")
set_target_properties(
  Geometry
  PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${SChapter10_BINARY_DIR}/out/bin"
    ARCHIVE_OUTPUT_DIRECTORY "${SChapter10_BINARY_DIR}/out/lib"
    LIBRARY_OUTPUT_DIRECTORY "${SChapter10_BINARY_DIR}/out/lib"
)
message("  Set output directories: ${SChapter10_BINARY_DIR}/out/{bin,lib}")

install(TARGETS Geometry FILE_SET api)

# >----------< TESTING >-------------------------------------------------------------------------< #

if(CMAKE_HOST_UNIX)
  # Passing test
  add_test(
    NAME PGeometry_TPassing
    COMMAND "${SChapter10_SOURCE_DIR}/tests/Geometry/passing.fish"
  )
  # Failing test
  add_test(
    NAME PGeometry_TFailing
    COMMAND "${SChapter10_SOURCE_DIR}/tests/Geometry/failing.fish"
  )
else()
  # Passing test
  add_test(
    NAME PGeometry_TPassing
    COMMAND "${SChapter10_SOURCE_DIR}/tests/Geometry/passing.ps1"
  )
  # Failing test
  add_test(
    NAME PGeometry_TFailing
    COMMAND "${SChapter10_SOURCE_DIR}/tests/Geometry/failing.ps1"
  )
endif()
