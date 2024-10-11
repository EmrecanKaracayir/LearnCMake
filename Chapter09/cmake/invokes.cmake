# >----------< FUNCTIONS >-----------------------------------------------------------------------< #

function(call_set VARIABLE_NAME VALUE)
  message("\nBefore calling call_set(): CH09_CALL_SET = ${CH09_CALL_SET}")
  message("[Invoke | cmake_language(CALL set)]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  cmake_language(CALL set ${VARIABLE_NAME} ${VALUE})
  return(PROPAGATE ${VARIABLE_NAME})
endfunction()

set(code_text [=[  message("  Hello, ${SUBJECT}!")]=])

function(print_eval SUBJECT)
  message("\n[Function | print_eval(SUBJECT)]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  message("  Evaluating code block:")
  message("  ${code_text}")
  cmake_language(EVAL CODE "${code_text}")
endfunction()

# >----------< CALLS >---------------------------------------------------------------------------< #

cmake_language(
  DEFER
  CALL message
  "\n[Invoke | cmake_language(DEFER CALL)]
    This will run as the last command in this file."
)

cmake_language(
  DEFER
  DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  CALL message
  "\n[Invoke | cmake_language(DEFER DIRECTORY CALL)]
    This will run as the last command in the top-level CMakeLists.txt."
)

call_set(CH09_CALL_SET "value")
message("After calling call_set(): CH09_CALL_SET = ${CH09_CALL_SET}")

print_eval("CMake")
