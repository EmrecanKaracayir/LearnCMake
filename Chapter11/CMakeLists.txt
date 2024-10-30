# >----------< CMAKE >---------------------------------------------------------------------------< #

cmake_minimum_required(VERSION 3.30)

# >----------< SOLUTION : Chapter11 >------------------------------------------------------------< #

project(SChapter11 VERSION 1.0.0 LANGUAGES CXX)

enable_testing()

# >----------< INCLUDES >------------------------------------------------------------------------< #

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/Language.cmake")
include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/Genexes.cmake")

# >----------< PROJECTS >------------------------------------------------------------------------< #

# Chapter11 -> {}
add_subdirectory("projects/Chapter11")
