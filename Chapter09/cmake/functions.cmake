# TITLE
message("\n*-----------*")
message("| FUNCTIONS |")
message("*-----------*")

# >----------< FUNCTIONS >-----------------------------------------------------------------------< #

function(print_hello_world)
  message("\n[Function | print_hello_world()]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  message("  Hello, World!")
endfunction()

function(print_hello SUBJECT)
  message("\n[Function | print_hello(SUBJECT)]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  message("  Hello, ${SUBJECT}!")
endfunction()

function(log LEVEL MESSAGE)
  message("\n[Function | log(LEVEL MESSAGE)]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  message("  [${LEVEL}] | ${MESSAGE}")
  if (DEFINED ARGV2)
    message("  [EXTRA] | ${ARGV2}")
  endif()
endfunction()

function(shop)
  message("\n[Function | shop()]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  set(NO_VALUE_ARGS "NOW")
  set(ONE_VALUE_ARGS "PAY_WITH")
  set(MULTI_VALUE_ARGS "THINGS")
  cmake_parse_arguments(
    PARSE_ARGV
    0
    "ARG"
    "${NO_VALUE_ARGS}"
    "${ONE_VALUE_ARGS}"
    "${MULTI_VALUE_ARGS}"
  )
  if(ARG_NOW)
    message("  Going shopping now!")
  else()
    message("  Going shopping later!")
  endif()
  if(DEFINED ARG_PAY_WITH)
    message("  Paying with: ${ARG_PAY_WITH}")
  else()
    message("  Paying with: cash")
  endif()
  if(DEFINED ARG_THINGS)
    message("  Buying things:")
    foreach(THING IN LISTS ARG_THINGS)
      message("    - ${THING}")
    endforeach()
  else()
    message("  Buying things: nothing")
  endif()
endfunction()

function(print_variable VARIABLE)
  message("\n[Function | print_variable(VARIABLE)]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  message("  VARIABLE: ${${VARIABLE}}")
endfunction()

function(create_dice LST_DICE)
  message("\nBefore calling create_dice(): CH09_FUN_LST_DICE = ${CH09_FUN_LST_DICE}")
  message("[Function | create_dice(LST_DICE)]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  set(${LST_DICE} 1 2 3 4 5 6)
  return(PROPAGATE ${LST_DICE})
endfunction()

function(modify_dice)
  message("\nBefore calling modify_dice(): CH09_FUN_LST_DICE = ${CH09_FUN_LST_DICE}")
  message("[Function | modify_dice()]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  _set(CH09_FUN_LST_DICE 6 5 4 3 2 1 PARENT_SCOPE)
endfunction()

function(current)
  message("\n[Function | current()]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  message("  CMAKE_CURRENT_FUNCTION: ${CMAKE_CURRENT_FUNCTION}")
  message("  CMAKE_CURRENT_LIST_DIR: ${CMAKE_CURRENT_LIST_DIR}")
  message("  CMAKE_CURRENT_FUNCTION_LIST_FILE: ${CMAKE_CURRENT_FUNCTION_LIST_FILE}")
  message("  CMAKE_CURRENT_FUNCTION_LIST_LINE: ${CMAKE_CURRENT_FUNCTION_LIST_LINE}")
endfunction()

function(inner_function)
  message("\n[Function | inner_function()]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
endfunction()

function(outer_function)
  message("\n[Function | outer_function()]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  cmake_parse_arguments(PARSE_ARGV 0 ARG "" "" "")
  set(ARGS "")
  foreach(ARG IN LISTS ARG_UNPARSED_ARGUMENTS)
    string(APPEND ARGS " [==[${ARG}]==]")
  endforeach()
  message("  Forwarding arguments: ${ARGS}")
  cmake_language(EVAL CODE "inner_function(${ARGS})")
endfunction()

# >----------< CALLS >---------------------------------------------------------------------------< #

print_hello_world()
print_hello("CMake")
log("ERROR" "Something went wrong!")
log("ERROR" "Some other thing went wrong!" "Some extra information.")
shop(NOW PAY_WITH "debit card" THINGS "apples" "bananas" "oranges")
shop(PAY_WITH "credit card" THINGS "grapes" "kiwi" "lemon")

set(CH09_FUN_VAR "value")
print_variable(CH09_FUN_VAR)

create_dice(CH09_FUN_LST_DICE)
message("After calling create_dice(): CH09_FUN_LST_DICE = ${CH09_FUN_LST_DICE}")

modify_dice()
message("After calling modify_dice(): CH09_FUN_LST_DICE = ${CH09_FUN_LST_DICE}")

current()

outer_function("a;b;c" "1;2;3" "x;y;z")
