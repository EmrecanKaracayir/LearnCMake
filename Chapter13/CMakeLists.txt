# >----------< CMAKE >---------------------------------------------------------------------------< #

cmake_minimum_required(VERSION 3.30)

# >----------< SOLUTION : Chapter13 >------------------------------------------------------------< #

project(SChapter13 VERSION 1.0.0 LANGUAGES NONE)

# >----------< INCLUDES >------------------------------------------------------------------------< #

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(Policy)
