# >----------< CMAKE >---------------------------------------------------------------------------< #

cmake_minimum_required(VERSION 3.30)

# >----------< SOLUTION : Chapter13 >------------------------------------------------------------< #

project(SLN_Chapter13 VERSION 1.0.0 LANGUAGES CXX)

# >----------< INCLUDES >------------------------------------------------------------------------< #

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(Policy)
