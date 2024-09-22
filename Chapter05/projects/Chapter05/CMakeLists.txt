# >----------< PROJECT : Chapter05 >-------------------------------------------------------------< #

project(PRJ_Chapter05)

# >----------< TARGET : Chapter05 >--------------------------------------------------------------< #

add_executable(Chapter05 "source/main.cpp")

target_include_directories(Chapter05 PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include")

target_link_libraries(
  Chapter05
  PRIVATE
  Log
  Geometry
  Statistics
)

# >----------< TESTS >---------------------------------------------------------------------------< #

if (UNIX)

  # Passing test
  add_test(
    NAME PassingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/passing.fish"
  )

  # Failing test
  add_test(
    NAME FailingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/failing.fish"
  )

else ()

  # Passing test
  add_test(
    NAME PassingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/passing.ps1"
  )

  # Failing test
  add_test(
    NAME FailingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/failing.ps1"
  )

endif (UNIX)
