# >----------< PROJECT : Math >------------------------------------------------------------------< #

project(PRJ_Log)

# >----------< TARGET : Log >--------------------------------------------------------------------< #

add_library(Log)

target_sources(
  Log
  PUBLIC
    FILE_SET api
    TYPE HEADERS
    BASE_DIRS "include"
    FILES
      "include/Log/log.hpp"
  PRIVATE
    "source/Log/log.cpp"
)

target_link_libraries(Log PUBLIC IO)

install(TARGETS Log FILE_SET api)

# >----------< TESTING >-------------------------------------------------------------------------< #

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
