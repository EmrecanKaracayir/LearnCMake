# >----------< PROJECT : Math >------------------------------------------------------------------< #

project(PRJ_Log)

# >----------< TARGET : Log >--------------------------------------------------------------------< #

add_library(
  Log
  "include/Log/log.hpp"
  "source/Log/log.cpp"
)

target_include_directories(Log PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")

target_link_libraries(Log PUBLIC IO)

# >----------< TESTS >---------------------------------------------------------------------------< #

if (UNIX)

  # Passing test
  add_test(
    NAME PassingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Log/passing.fish"
  )

  # Failing test
  add_test(
    NAME FailingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Log/failing.fish"
  )

else ()

  # Passing test
  add_test(
    NAME PassingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Log/passing.ps1"
  )

  # Failing test
  add_test(
    NAME FailingTest
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Log/failing.ps1"
  )

endif (UNIX)
