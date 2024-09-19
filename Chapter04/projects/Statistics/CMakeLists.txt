# [PROJECT]: Statistics
project(PRJ_Statistics)

# [TARGET]: Statistics
add_library(
  Statistics
  "include/Statistics/average.hpp"
  "source/Statistics/average.cpp"
)

# [INCLUDE]: Statistics
target_include_directories(Statistics PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")

# [LINK]: Statistics
target_link_libraries(Statistics PUBLIC Math)
