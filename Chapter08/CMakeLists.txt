# >----------< CMAKE >---------------------------------------------------------------------------< #

cmake_minimum_required(VERSION 3.30)

# >----------< SOLUTION : Chapter08 >------------------------------------------------------------< #

project(SLN_Chapter08 VERSION 1.0.0 LANGUAGES NONE)

# >----------< INCLUDES >------------------------------------------------------------------------< #

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/include.cmake")

# >----------< CONDTIONS >-----------------------------------------------------------------------< #

message("\n[TOPDIR | Conditions]")
message("  PROJECT_IS_TOP_LEVEL       > ${PROJECT_IS_TOP_LEVEL}")
message("  SLN_Chapter08_IS_TOP_LEVEL > ${SLN_Chapter08_IS_TOP_LEVEL}")

# >----------< PATHS >---------------------------------------------------------------------------< #

message("\n[TOPDIR | Paths]")
message("  CMAKE_SOURCE_DIR         > ${CMAKE_SOURCE_DIR}")
message("  CMAKE_BINARY_DIR         > ${CMAKE_BINARY_DIR}")
message("  CMAKE_CURRENT_SOURCE_DIR > ${CMAKE_CURRENT_SOURCE_DIR}")
message("  CMAKE_CURRENT_BINARY_DIR > ${CMAKE_CURRENT_BINARY_DIR}")

message("\n[TOPDIR | Project paths]")
message("  PROJECT_SOURCE_DIR       > ${PROJECT_SOURCE_DIR}")
message("  PROJECT_BINARY_DIR       > ${PROJECT_BINARY_DIR}")
message("  SLN_Chapter08_SOURCE_DIR > ${SLN_Chapter08_SOURCE_DIR}")
message("  SLN_Chapter08_BINARY_DIR > ${SLN_Chapter08_BINARY_DIR}")

# >----------< VARIABLES >-----------------------------------------------------------------------< #

message("\n[TOPDIR | Variables]")
set(CH08_VAR_TOPDIR "created in topdir")
message("  [create] CH08_VAR_TOPDIR < ${CH08_VAR_TOPDIR}")
set(CH08_VAR_PARENT "created in topdir")
message("  [create] CH08_VAR_PARENT < ${CH08_VAR_PARENT}")
set(CH08_VAR_PRPGTE "created in topdir")
message("  [create] CH08_VAR_PRPGTE < ${CH08_VAR_PRPGTE}")
message("  [access] CH08_VAR_INCDIR > ${CH08_VAR_INCDIR}")
set(CH08_VAR_INCDIR "updated in topdir")
message("  [update] CH08_VAR_INCDIR < ${CH08_VAR_INCDIR}")

# >----------< PROJECTS >------------------------------------------------------------------------< #

# Chapter08 -> {}
add_subdirectory("projects/Chapter08")

# >----------< VARIABLES >-----------------------------------------------------------------------< #

message("\n[TOPDIR | Variables]")
message("  [access] CH08_VAR_TOPDIR > ${CH08_VAR_TOPDIR}")
message("  [access] CH08_VAR_PARENT > ${CH08_VAR_PARENT}")
message("  [access] CH08_VAR_PRPGTE > ${CH08_VAR_PRPGTE}")
message("  [access] CH08_VAR_INCDIR > ${CH08_VAR_INCDIR}")

# >----------< INCLUDES >------------------------------------------------------------------------< #

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/include.cmake")
