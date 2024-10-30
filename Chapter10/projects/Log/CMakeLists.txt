# >----------< PROJECT : Math >------------------------------------------------------------------< #

project(PLog VERSION ${SChapter10_VERSION} LANGUAGES CXX)

# >----------< TARGET : Log >--------------------------------------------------------------------< #

add_library(Log)

target_sources(
  Log
  PUBLIC
    FILE_SET api
    TYPE HEADERS
    BASE_DIRS "include"
    FILES
      "include/Log/log.hpp"
  PRIVATE
    "source/Log/log.cpp"
)

target_link_libraries(Log PUBLIC IO)

message("\n[Properties | TARGET : Log]")
set_target_properties(
  Log
  PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${SChapter10_BINARY_DIR}/out/bin"
    ARCHIVE_OUTPUT_DIRECTORY "${SChapter10_BINARY_DIR}/out/lib"
    LIBRARY_OUTPUT_DIRECTORY "${SChapter10_BINARY_DIR}/out/lib"
)
message("  Set output directories: ${SChapter10_BINARY_DIR}/out/{bin,lib}")

install(TARGETS Log FILE_SET api)

# >----------< TESTING >-------------------------------------------------------------------------< #

if(CMAKE_HOST_UNIX)
  # Passing test
  add_test(
    NAME PLog_TPassing
    COMMAND "${SChapter10_SOURCE_DIR}/tests/Log/passing.fish"
  )
  # Failing test
  add_test(
    NAME PLog_TFailing
    COMMAND "${SChapter10_SOURCE_DIR}/tests/Log/failing.fish"
  )
else()
  # Passing test
  add_test(
    NAME PLog_TPassing
    COMMAND "${SChapter10_SOURCE_DIR}/tests/Log/passing.ps1"
  )
  # Failing test
  add_test(
    NAME PLog_TFailing
    COMMAND "${SChapter10_SOURCE_DIR}/tests/Log/failing.ps1"
  )
endif()
