# [PROJECT]: Chapter04
project(PRJ_Chapter04)

# [TARGET]: Chapter04
add_executable(Chapter04 "source/main.cpp")

# [INCLUDE]: Chapter04
target_include_directories(Chapter04 PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include")

# [LINK]: Chapter04 -> Log
target_link_libraries(Chapter04 PRIVATE Log)

# [LINK]: Chapter04 -> Geometry
target_link_libraries(Chapter04 PRIVATE Geometry)

# [LINK]: Chapter04 -> Statistics
target_link_libraries(Chapter04 PRIVATE Statistics)
