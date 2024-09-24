# >----------< PROJECT : Chapter04 >-------------------------------------------------------------< #

project(PRJ_Chapter04)

# >----------< TARGET : Chapter04 >--------------------------------------------------------------< #

add_executable(Chapter04)

target_sources(
  Chapter04
  PRIVATE
    "source/main.cpp"
)

target_link_libraries(
  Chapter04
  PRIVATE
    Log
    Geometry
    Statistics
)
