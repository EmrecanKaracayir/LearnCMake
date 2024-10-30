# >----------< PROJECT : Chapter11 >-------------------------------------------------------------< #

project(PChapter11 VERSION ${SChapter11_VERSION} LANGUAGES CXX)

# >----------< TARGET : Chapter11 >--------------------------------------------------------------< #

add_executable(Chapter11)

target_sources(
  Chapter11
  PRIVATE
    "source/main.cpp"
)

set_target_properties(
  Chapter11
  PROPERTIES
    VERSION 1.0.0
)

target_compile_definitions(
  Chapter11
  PRIVATE
    VERSION="$<TARGET_PROPERTY:VERSION>"
)

add_custom_target(
  FileNameGenex ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Target : Chapter11]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Binary name: $<TARGET_FILE_NAME:Chapter11>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Binary dir : $<TARGET_FILE_DIR:Chapter11>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Binary path: $<TARGET_FILE:Chapter11>"
  VERBATIM
)

# >----------< TESTING >-------------------------------------------------------------------------< #

set(testDir "${SChapter11_SOURCE_DIR}/tests/Chapter11")
set(hostIsUnix $<PLATFORM_ID:Darwin,Linux>)

add_test(
  NAME PChapter11_TPassing
  COMMAND $<IF:${hostIsUnix},${testDir}/passing.fish,${testDir}/passing.ps1>
)

add_test(
  NAME PChapter11_TFailing
  COMMAND $<IF:${hostIsUnix},${testDir}/failing.fish,${testDir}/failing.ps1>
)
