# [VERSION]: CMake
cmake_minimum_required(VERSION 3.30)

# [SOLUTION]: Chapter04
project(SLN_Chapter04 VERSION 1.0.0 LANGUAGES CXX)

# [CMAKE]: Language
include("${CMAKE_SOURCE_DIR}/cmake/language.cmake")

# [PROJECT]: IO
# [DEPENDS]: {}
add_subdirectory("projects/IO")

# [PROJECT]: Log
# [DEPENDS]: { IO }
add_subdirectory("projects/Log")

# [PROJECT]: Math
# [DEPENDS]: {}
add_subdirectory("projects/Math")

# [PROJECT]: Geometry
# [DEPENDS]: { Math }
add_subdirectory("projects/Geometry")

# [PROJECT]: Statistics
# [DEPENDS]: { Math }
add_subdirectory("projects/Statistics")

# [PROJECT]: Chapter04
# [DEPENDS]: { Log, Geometry, Statistics }
add_subdirectory("projects/Chapter04")
