# >----------< CMAKE >---------------------------------------------------------------------------< #

cmake_minimum_required(VERSION 3.30)

# >----------< SOLUTION : Chapter04 >------------------------------------------------------------< #

project(SChapter04 VERSION 1.0.0 LANGUAGES CXX)

# >----------< INCLUDES >------------------------------------------------------------------------< #

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/Language.cmake")

# >----------< PROJECTS >------------------------------------------------------------------------< #

# IO -> {}
add_subdirectory("projects/IO")

# Log -> { IO }
add_subdirectory("projects/Log")

# Math -> {}
add_subdirectory("projects/Math")

# Geometry -> { Math }
add_subdirectory("projects/Geometry")

# Statistics -> { Math }
add_subdirectory("projects/Statistics")

# Chapter04 -> { Log, Geometry, Statistics }
add_subdirectory("projects/Chapter04")
