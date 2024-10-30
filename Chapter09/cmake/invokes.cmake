# >----------< FUNCTIONS >-----------------------------------------------------------------------< #

function(callSet variableName value)
  message("\nBefore calling callSet(): varToSet = ${varToSet}")
  message("[Invoke | cmake_language(CALL set)]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  cmake_language(CALL set ${variableName} ${value})
  return(PROPAGATE ${variableName})
endfunction()

set(codeText [=[  message("  Hello, ${subject}!")]=])

function(printEval subject)
  message("\n[Function | printEval(subject)]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  message("  Evaluating code block:")
  message("  ${codeText}")
  cmake_language(EVAL CODE "${codeText}")
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

callSet("varToSet" "value")
message("After calling callSet(): varToSet = ${varToSet}")

printEval("CMake")
