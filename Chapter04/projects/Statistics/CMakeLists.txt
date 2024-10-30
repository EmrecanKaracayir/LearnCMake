# >----------< PROJECT : Statistics >------------------------------------------------------------< #

project(PStatistics VERSION ${SChapter04_VERSION} LANGUAGES CXX)

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
