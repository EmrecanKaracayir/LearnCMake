# >----------< PROJECT : Chapter14 >-------------------------------------------------------------< #

list(APPEND CMAKE_MESSAGE_CONTEXT "PChapter14")

project(PChapter14 VERSION ${SChapter14_VERSION} LANGUAGES CXX)

# >----------< INCLUDES >------------------------------------------------------------------------< #

include(CMakePrintHelpers)

# >----------< TARGET : Chapter14 >--------------------------------------------------------------< #

add_executable(Chapter14)

target_sources(
  Chapter14
  PRIVATE
    "source/main.cpp"
)

# >----------< PRINTS >--------------------------------------------------------------------------< #

cmake_print_properties(
  TARGETS Chapter14
  PROPERTIES TYPE
)

cmake_print_properties(
  SOURCES "source/main.cpp"
  PROPERTIES LANGUAGE
)

cmake_print_variables(
  CMAKE_CXX_COMPILER
)
