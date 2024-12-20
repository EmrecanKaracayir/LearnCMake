# >----------< PROJECT : Chapter10 >-------------------------------------------------------------< #

project(PChapter10 VERSION ${SChapter10_VERSION} LANGUAGES CXX)

# >----------< TARGET : Chapter10 >--------------------------------------------------------------< #

add_executable(Chapter10)

target_sources(
  Chapter10
  PRIVATE
    "source/main.cpp"
)

target_link_libraries(
  Chapter10
  PRIVATE
    Log
    Geometry
    Statistics
)

message("\n[Properties | TARGET : Chapter10]")
set_target_properties(
  Chapter10
  PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${SChapter10_BINARY_DIR}/out/bin"
    ARCHIVE_OUTPUT_DIRECTORY "${SChapter10_BINARY_DIR}/out/lib"
    LIBRARY_OUTPUT_DIRECTORY "${SChapter10_BINARY_DIR}/out/lib"
)
message("  Set output directories: ${SChapter10_BINARY_DIR}/out/{bin,lib}")

install(TARGETS Chapter10)

# >----------< TESTING >-------------------------------------------------------------------------< #

if(CMAKE_HOST_UNIX)
  # Passing test
  add_test(
    NAME PChapter10_TPassing
    COMMAND "${SChapter10_SOURCE_DIR}/tests/Chapter10/passing.fish"
  )
  # Failing test
  add_test(
    NAME PChapter10_TFailing
    COMMAND "${SChapter10_SOURCE_DIR}/tests/Chapter10/failing.fish"
  )
else()
  # Passing test
  add_test(
    NAME PChapter10_TPassing
    COMMAND "${SChapter10_SOURCE_DIR}/tests/Chapter10/passing.ps1"
  )
  # Failing test
  add_test(
    NAME PChapter10_TFailing
    COMMAND "${SChapter10_SOURCE_DIR}/tests/Chapter10/failing.ps1"
  )
endif()
