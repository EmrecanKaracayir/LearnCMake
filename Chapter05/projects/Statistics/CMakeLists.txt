# >----------< PROJECT : Statistics >------------------------------------------------------------< #

project(PStatistics VERSION ${SChapter05_VERSION} LANGUAGES CXX)

# >----------< TARGET : Statistics >-------------------------------------------------------------< #

add_library(Statistics)

target_sources(
  Statistics
  PUBLIC
    FILE_SET api
    TYPE HEADERS
    BASE_DIRS "include"
    FILES
      "include/Statistics/average.hpp"
  PRIVATE
    "source/Statistics/average.cpp"
)

target_link_libraries(Statistics PUBLIC Math)

install(TARGETS Statistics FILE_SET api)

# >----------< TESTING >-------------------------------------------------------------------------< #

if(CMAKE_HOST_UNIX)
  # Passing test
  add_test(
    NAME PStatistics_TPassing
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Statistics/passing.fish"
  )
  # Failing test
  add_test(
    NAME PStatistics_TFailing
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Statistics/failing.fish"
  )
else()
  # Passing test
  add_test(
    NAME PStatistics_TPassing
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Statistics/passing.ps1"
  )
  # Failing test
  add_test(
    NAME PStatistics_TFailing
    COMMAND "${CMAKE_SOURCE_DIR}/tests/Statistics/failing.ps1"
  )
endif()
