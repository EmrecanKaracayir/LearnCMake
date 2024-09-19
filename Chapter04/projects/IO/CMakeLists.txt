# [PROJECT]: IO
project(PRJ_IO)

# [TARGET]: IO
add_library(
  IO
  INTERFACE
  "include/IO/input.hpp"
  "include/IO/output.hpp"
)

# [INCLUDE]: IO
target_include_directories(IO INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}/include")
