# >----------< PROJECT : Chapter05 >-------------------------------------------------------------< #

project(PRJ_Chapter05)

# >----------< TARGET : Chapter05 >--------------------------------------------------------------< #

add_executable(Chapter05)

target_sources(
  Chapter05
  PRIVATE
  "source/main.cpp"
)

target_link_libraries(
  Chapter05
  PRIVATE
  Log
  Geometry
  Statistics
)

install(TARGETS Chapter05)

# >----------< TESTING >-------------------------------------------------------------------------< #

if(CMAKE_HOST_UNIX)
  # Passing test
  add_test(
    NAME PRJ_Chapter05_PassingTest
    COMMAND "${SLN_Chapter05_SOURCE_DIR}/tests/Chapter05/passing.fish"
  )

  # Failing test
  add_test(
    NAME PRJ_Chapter05_FailingTest
    COMMAND "${SLN_Chapter05_SOURCE_DIR}/tests/Chapter05/failing.fish"
  )
else()
  # Passing test
  add_test(
    NAME PRJ_Chapter05_PassingTest
    COMMAND "${SLN_Chapter05_SOURCE_DIR}/tests/Chapter05/passing.ps1"
  )

  # Failing test
  add_test(
    NAME PRJ_Chapter05_FailingTest
    COMMAND "${SLN_Chapter05_SOURCE_DIR}/tests/Chapter05/failing.ps1"
  )
endif()
