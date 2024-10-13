# >----------< PROJECT : Chapter05 >-------------------------------------------------------------< #

project(PRJ_Chapter11)

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
  Chapter11_FileName ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Target : Chapter11]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Binary name: $<TARGET_FILE_NAME:Chapter11>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Binary dir : $<TARGET_FILE_DIR:Chapter11>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Binary path: $<TARGET_FILE:Chapter11>"
  VERBATIM
)

# >----------< TESTING >-------------------------------------------------------------------------< #

set(CH11_TEST_DIR "${SLN_Chapter11_SOURCE_DIR}/tests/Chapter11")
set(CH11_HOST_UNIX $<PLATFORM_ID:Darwin,Linux>)

add_test(
  NAME PRJ_Chapter11_PassingTest
  COMMAND $<IF:${CH11_HOST_UNIX},${CH11_TEST_DIR}/passing.fish,${CH11_TEST_DIR}/passing.ps1>
)

add_test(
  NAME PRJ_Chapter11_FailingTest
  COMMAND $<IF:${CH11_HOST_UNIX},${CH11_TEST_DIR}/failing.fish,${CH11_TEST_DIR}/failing.ps1>
)
