# >----------< CMAKE >---------------------------------------------------------------------------< #

cmake_minimum_required(VERSION 3.30)

# >----------< SOLUTION : Chapter05 >------------------------------------------------------------< #

project(SLN_Chapter05 VERSION 1.0.0 LANGUAGES CXX)

enable_testing()

# >----------< INCLUDES >------------------------------------------------------------------------< #

# Language configurations
include("${CMAKE_SOURCE_DIR}/cmake/language.cmake")

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

# Chapter05 -> { Log, Geometry, Statistics }
add_subdirectory("projects/Chapter05")
