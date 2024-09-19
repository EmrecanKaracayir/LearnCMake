# [VERSION]: CMake
cmake_minimum_required(VERSION 3.30)

# [SOLUTION]: Chapter03
project(SLN_Chapter03 VERSION 1.0.0 LANGUAGES CXX)

# [VERSION]: C++20
set(CMAKE_CXX_STANDARD 20)

# [PROJECT]: Chapter03
add_subdirectory("projects/Chapter03")
