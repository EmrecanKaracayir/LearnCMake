# >----------< PROJECT : Chapter05 >-------------------------------------------------------------< #

project(PChapter05 VERSION ${SChapter05_VERSION} LANGUAGES CXX)

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
    NAME PChapter05_TPassing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/Chapter05/passing.fish"
  )
  # Failing test
  add_test(
    NAME PChapter05_TFailing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/Chapter05/failing.fish"
  )
else()
  # Passing test
  add_test(
    NAME PChapter05_TPassing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/Chapter05/passing.ps1"
  )
  # Failing test
  add_test(
    NAME PChapter05_TFailing
    COMMAND "${SChapter05_SOURCE_DIR}/tests/Chapter05/failing.ps1"
  )
endif()
