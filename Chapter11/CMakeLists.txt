# >----------< CMAKE >---------------------------------------------------------------------------< #

cmake_minimum_required(VERSION 3.30)

# >----------< SOLUTION : Chapter11 >------------------------------------------------------------< #

project(SLN_Chapter11 VERSION 1.0.0 LANGUAGES CXX)

enable_testing()

# >----------< INCLUDES >------------------------------------------------------------------------< #

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/language.cmake")
include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/genexes.cmake")

# >----------< PROJECTS >------------------------------------------------------------------------< #

# Chapter11 -> {}
add_subdirectory("projects/Chapter11")
