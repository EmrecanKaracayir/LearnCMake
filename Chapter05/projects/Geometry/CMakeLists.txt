# >----------< PROJECT : Geometry >--------------------------------------------------------------< #

project(PRJ_Geometry)

# >----------< TARGET : Geometry >---------------------------------------------------------------< #

add_library(
  Geometry
  "include/Geometry/Rectangle.hpp"
  "source/Geometry/Rectangle.cpp"
)

target_include_directories(Geometry PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")

target_link_libraries(Geometry PRIVATE Math)

# >----------< TESTS >---------------------------------------------------------------------------< #

if (UNIX)

  # Passing test
  add_test(
    NAME PassingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Geometry/passing.fish"
  )

  # Failing test
  add_test(
    NAME FailingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Geometry/failing.fish"
  )

else ()

  # Passing test
  add_test(
    NAME PassingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Geometry/passing.ps1"
  )

  # Failing test
  add_test(
    NAME FailingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Geometry/failing.ps1"
  )

endif (UNIX)
