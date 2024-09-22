# [PROJECT]: Math
project(PRJ_Math)

# [TARGET]: Math
add_library(
  Math
  "include/Math/addition.hpp"
  "include/Math/division.hpp"
  "include/Math/multiplication.hpp"
  "include/Math/subtraction.hpp"
  "source/Math/addition.cpp"
  "source/Math/division.cpp"
  "source/Math/multiplication.cpp"
  "source/Math/subtraction.cpp"
)

# [INCLUDE]: Math
target_include_directories(Math PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
