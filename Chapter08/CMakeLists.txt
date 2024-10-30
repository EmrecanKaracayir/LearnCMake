# >----------< CMAKE >---------------------------------------------------------------------------< #

cmake_minimum_required(VERSION 3.30)

# >----------< SOLUTION : Chapter08 >------------------------------------------------------------< #

project(SChapter08 VERSION 1.0.0 LANGUAGES NONE)

# >----------< INCLUDES >------------------------------------------------------------------------< #

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/Include.cmake")

# >----------< CONDTIONS >-----------------------------------------------------------------------< #

message("\n[TOPDIR | Conditions]")
message("  PROJECT_IS_TOP_LEVEL    > ${PROJECT_IS_TOP_LEVEL}")
message("  SChapter08_IS_TOP_LEVEL > ${SChapter08_IS_TOP_LEVEL}")

# >----------< PATHS >---------------------------------------------------------------------------< #

message("\n[TOPDIR | Paths]")
message("  CMAKE_SOURCE_DIR         > ${CMAKE_SOURCE_DIR}")
message("  CMAKE_BINARY_DIR         > ${CMAKE_BINARY_DIR}")
message("  CMAKE_CURRENT_SOURCE_DIR > ${CMAKE_CURRENT_SOURCE_DIR}")
message("  CMAKE_CURRENT_BINARY_DIR > ${CMAKE_CURRENT_BINARY_DIR}")

message("\n[TOPDIR | Project paths]")
message("  PROJECT_SOURCE_DIR    > ${PROJECT_SOURCE_DIR}")
message("  PROJECT_BINARY_DIR    > ${PROJECT_BINARY_DIR}")
message("  SChapter08_SOURCE_DIR > ${SChapter08_SOURCE_DIR}")
message("  SChapter08_BINARY_DIR > ${SChapter08_BINARY_DIR}")

# >----------< VARIABLES >-----------------------------------------------------------------------< #

message("\n[TOPDIR | Variables]")
set(varTopDir "created in topdir")
message("  [create] varTopDir < ${varTopDir}")
set(parTopDir "created in topdir")
message("  [create] parTopDir < ${parTopDir}")
set(prpTopDir "created in topdir")
message("  [create] prpTopDir < ${prpTopDir}")
message("  [access] varIncDir > ${varIncDir}")
set(varIncDir "updated in topdir")
message("  [update] varIncDir < ${varIncDir}")

# >----------< PROJECTS >------------------------------------------------------------------------< #

# Chapter08 -> {}
add_subdirectory("projects/Chapter08")

# >----------< VARIABLES >-----------------------------------------------------------------------< #

message("\n[TOPDIR | Variables]")
message("  [access] varTopDir > ${varTopDir}")
message("  [access] parTopDir > ${parTopDir}")
message("  [access] prpTopDir > ${prpTopDir}")
message("  [access] varIncDir > ${varIncDir}")

# >----------< INCLUDES >------------------------------------------------------------------------< #

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/include.cmake")
