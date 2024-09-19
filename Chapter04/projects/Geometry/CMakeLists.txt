# [PROJECT]: Geometry
project(PRJ_Geometry)

# [TARGET]: Geometry
add_library(
  Geometry
  "include/Geometry/Rectangle.hpp"
  "source/Geometry/Rectangle.cpp"
)

# [INCLUDE]: Geometry
target_include_directories(Geometry PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")

# [LINK]: Geometry
target_link_libraries(Geometry PRIVATE Math)
