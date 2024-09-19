# [PROJECT]: Chapter03
project(PRJ_Chapter03)

# [TARGET]: Chapter03
add_executable(Chapter03 "source/main.cpp")

# [INCLUDE]: Chapter03
target_include_directories(Chapter03 PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include")
