# >----------< CMAKE >---------------------------------------------------------------------------< #

cmake_minimum_required(VERSION 3.30)

# >----------< SOLUTION : Chapter10 >------------------------------------------------------------< #

project(SChapter10 VERSION 1.0.0 LANGUAGES CXX)

enable_testing()

# >----------< INCLUDES >------------------------------------------------------------------------< #

include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/properties.cmake")
include("${CMAKE_CURRENT_SOURCE_DIR}/cmake/language.cmake")

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

# Chapter10 -> { Log, Geometry, Statistics }
add_subdirectory("projects/Chapter10")

# >----------< PACKAGING >-----------------------------------------------------------------------< #

set(CPACK_PACKAGE_NAME "Chapter10")
set(CPACK_PACKAGE_VENDOR "Emrecan Karacayir")
set(
  CPACK_PACKAGE_DESCRIPTION_SUMMARY
  "An example project for the book Professional CMake: A Practical Guide."
)
set(CPACK_PACKAGE_INSTALL_DIRECTORY "${CPACK_PACKAGE_NAME}")
set(CPACK_VERBATIM_VARIABLES TRUE)

include(CPack)
