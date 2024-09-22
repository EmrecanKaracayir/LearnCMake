# >----------< PROJECT : Statistics >------------------------------------------------------------< #

project(PRJ_Statistics)

# >----------< TARGET : Statistics >-------------------------------------------------------------< #

add_library(
  Statistics
  "include/Statistics/average.hpp"
  "source/Statistics/average.cpp"
)

target_include_directories(Statistics PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")

target_link_libraries(Statistics PUBLIC Math)

# >----------< TESTS >---------------------------------------------------------------------------< #

if (UNIX)

  # Passing test
  add_test(
    NAME PassingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Statistics/passing.fish"
  )

  # Failing test
  add_test(
    NAME FailingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Statistics/failing.fish"
  )

else ()

  # Passing test
  add_test(
    NAME PassingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Statistics/passing.ps1"
  )

  # Failing test
  add_test(
    NAME FailingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Statistics/failing.ps1"
  )

endif (UNIX)
