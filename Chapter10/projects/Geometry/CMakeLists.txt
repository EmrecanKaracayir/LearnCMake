# >----------< PROJECT : Geometry >--------------------------------------------------------------< #

project(PRJ_Geometry)

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
    RUNTIME_OUTPUT_DIRECTORY "${SLN_Chapter10_BINARY_DIR}/out/bin"
    ARCHIVE_OUTPUT_DIRECTORY "${SLN_Chapter10_BINARY_DIR}/out/lib"
    LIBRARY_OUTPUT_DIRECTORY "${SLN_Chapter10_BINARY_DIR}/out/lib"
)
message("  Set output directories: ${SLN_Chapter10_BINARY_DIR}/out/{bin,lib}")

install(TARGETS Geometry FILE_SET api)

# >----------< TESTING >-------------------------------------------------------------------------< #

if(CMAKE_HOST_UNIX)
  # Passing test
  add_test(
    NAME PRJ_Geometry_PassingTest
    COMMAND "${SLN_Chapter10_SOURCE_DIR}/tests/Geometry/passing.fish"
  )

  # Failing test
  add_test(
    NAME PRJ_Geometry_FailingTest
    COMMAND "${SLN_Chapter10_SOURCE_DIR}/tests/Geometry/failing.fish"
  )
else()
  # Passing test
  add_test(
    NAME PRJ_Geometry_PassingTest
    COMMAND "${SLN_Chapter10_SOURCE_DIR}/tests/Geometry/passing.ps1"
  )

  # Failing test
  add_test(
    NAME PRJ_Geometry_FailingTest
    COMMAND "${SLN_Chapter10_SOURCE_DIR}/tests/Geometry/failing.ps1"
  )
endif()
