# >----------< CMAKE >---------------------------------------------------------------------------< #

cmake_minimum_required(VERSION 3.30)

# >----------< SOLUTION : Chapter12 >------------------------------------------------------------< #

project(SChapter12 VERSION 1.0.0 LANGUAGES CXX)

# >----------< INCLUDES >------------------------------------------------------------------------< #

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(Language)

# >----------< PROJECTS >------------------------------------------------------------------------< #

# Chapter12 -> {}
add_subdirectory("projects/Chapter12")
