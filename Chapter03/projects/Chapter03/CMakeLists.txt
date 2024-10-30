# >----------< PROJECT : Chapter03 >-------------------------------------------------------------< #

project(PChapter03 VERSION ${SChapter03_VERSION} LANGUAGES CXX)

# >----------< TARGET : Chapter03 >--------------------------------------------------------------< #

add_executable(Chapter03)

target_sources(
  Chapter03
  PRIVATE
    "source/main.cpp"
)
