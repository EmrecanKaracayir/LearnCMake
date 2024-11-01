# >----------< PROJECT : Chapter15 >-------------------------------------------------------------< #

project(PChapter15 VERSION ${SChapter15_VERSION} LANGUAGES CXX)

# >----------< TARGET : Chapter15 >--------------------------------------------------------------< #

add_executable(Chapter15)

target_sources(
  Chapter15
  PRIVATE
    "source/main.cpp"
)

add_compile_definitions(
  [[BUILD_TYPE="$<CONFIG>"]]
)
