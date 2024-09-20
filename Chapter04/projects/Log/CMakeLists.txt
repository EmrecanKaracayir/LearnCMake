# [PROJECT]: Log
project(PRJ_Log)

# [TARGET]: Log
add_library(
  Log
  "include/Log/log.hpp"
  "source/Log/log.cpp"
)

# [INCLUDE]: Log
target_include_directories(Log PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")

# [LINK]: Log
target_link_libraries(Log PUBLIC IO)
