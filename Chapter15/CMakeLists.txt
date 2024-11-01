# >----------< CMAKE >---------------------------------------------------------------------------< #

cmake_minimum_required(VERSION 3.30)

# >----------< DEFAULTS >------------------------------------------------------------------------< #

get_cmake_property(isMultiConfig GENERATOR_IS_MULTI_CONFIG)
if(NOT isMultiConfig)
  set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "Build type")
endif()

# >----------< SOLUTION : Chapter15 >------------------------------------------------------------< #

project(SChapter15 VERSION 1.0.0 LANGUAGES CXX)

# >----------< BUILD TYPE >----------------------------------------------------------------------< #

if (SChapter15_IS_TOP_LEVEL)
  if (NOT isMultiConfig)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "Distribution")
  else()
    list(REMOVE_ITEM CMAKE_CONFIGURATION_TYPES "MinSizeRel")
    list(REMOVE_ITEM CMAKE_CONFIGURATION_TYPES "RelWithDebInfo")
    if (NOT "Debug" IN_LIST CMAKE_CONFIGURATION_TYPES)
      list(APPEND CMAKE_CONFIGURATION_TYPES "Debug")
    endif()
    if (NOT "Release" IN_LIST CMAKE_CONFIGURATION_TYPES)
      list(APPEND CMAKE_CONFIGURATION_TYPES "Release")
    endif()
    if (NOT "Distribution" IN_LIST CMAKE_CONFIGURATION_TYPES)
      list(APPEND CMAKE_CONFIGURATION_TYPES "Distribution")
    endif()
  endif()
endif()

set(CMAKE_C_FLAGS_DISTRIBUTION             "${CMAKE_C_FLAGS_RELEASE}")
set(CMAKE_CXX_FLAGS_DISTRIBUTION           "${CMAKE_CXX_FLAGS_RELEASE}")
set(CMAKE_EXE_LINKER_FLAGS_DISTRIBUTION    "${CMAKE_EXE_LINKER_FLAGS_RELEASE}")
set(CMAKE_SHARED_LINKER_FLAGS_DISTRIBUTION "${CMAKE_SHARED_LINKER_FLAGS_RELEASE}")
set(CMAKE_STATIC_LINKER_FLAGS_DISTRIBUTION "${CMAKE_STATIC_LINKER_FLAGS_RELEASE}")
set(CMAKE_MODULE_LINKER_FLAGS_DISTRIBUTION "${CMAKE_MODULE_LINKER_FLAGS_RELEASE}")

set(CMAKE_DISTRIBUTION_POSTFIX "_dist")

# >----------< INCLUDES >------------------------------------------------------------------------< #

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

include(Language)

# >----------< PROJECTS >------------------------------------------------------------------------< #

add_subdirectory("projects/Chapter15")

message(STATUS "Build type          : ${CMAKE_BUILD_TYPE}")
message(STATUS "Configuration types : ${CMAKE_CONFIGURATION_TYPES}")
