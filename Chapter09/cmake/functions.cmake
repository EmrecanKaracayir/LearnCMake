# TITLE
message("\n*-----------*")
message("| FUNCTIONS |")
message("*-----------*")

# >----------< FUNCTIONS >-----------------------------------------------------------------------< #

function(printHelloWorld)
  message("\n[Function | printHelloWorld()]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  message("  Hello, World!")
endfunction()

function(printHello subject)
  message("\n[Function | printHello(subject)]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  message("  Hello, ${subject}!")
endfunction()

function(log level message)
  message("\n[Function | log(level message)]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  message("  [${level}] | ${message}")
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
  set(noValueArgs "NOW")
  set(oneValueArgs "PAY_WITH")
  set(multiValueArgs "THINGS")
  cmake_parse_arguments(
    PARSE_ARGV
    0
    "ARG"
    "${noValueArgs}"
    "${oneValueArgs}"
    "${multiValueArgs}"
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
    foreach(thing IN LISTS ARG_THINGS)
      message("    - ${thing}")
    endforeach()
  else()
    message("  Buying things: nothing")
  endif()
endfunction()

function(printVariable variable)
  message("\n[Function | printVariable(variable)]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  message("  variable: ${${variable}}")
endfunction()

function(createDice variableName)
  message("\nBefore calling createDice(): fnc_dice = ${fnc_dice}")
  message("[Function | createDice(fnc_dice)]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  set(${variableName} 1 2 3 4 5 6)
  return(PROPAGATE ${variableName})
endfunction()

function(modifyDice)
  message("\nBefore calling modifyDice(): fnc_dice = ${fnc_dice}")
  message("[Function | modifyDice()]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  _set(fnc_dice 6 5 4 3 2 1 PARENT_SCOPE)
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

function(innerFunction)
  message("\n[Function | innerFunction()]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
endfunction()

function(outerFunction)
  message("\n[Function | outerFunction()]")
  message("  Arguments:")
  message("    ARGC = ${ARGC}")
  message("    ARGV = ${ARGV}")
  message("    ARGN = ${ARGN}")
  cmake_parse_arguments(PARSE_ARGV 0 "ARG" "" "" "")
  set(args "")
  foreach(arg IN LISTS ARG_UNPARSED_ARGUMENTS)
    string(APPEND args " [==[${arg}]==]")
  endforeach()
  message("  Forwarding arguments: ${args}")
  cmake_language(EVAL CODE "innerFunction(${args})")
endfunction()

# >----------< CALLS >---------------------------------------------------------------------------< #

printHelloWorld()
printHello("CMake")
log("ERROR" "Something went wrong!")
log("ERROR" "Some other thing went wrong!" "Some extra information.")
shop(NOW PAY_WITH "debit card" THINGS "apples" "bananas" "oranges")
shop(PAY_WITH "credit card" THINGS "grapes" "kiwi" "lemon")

set(fnc_var "value")
printVariable(fnc_var)

createDice("fnc_dice")
message("After calling create_dice(): fnc_dice = ${fnc_dice}")

modifyDice()
message("After calling modify_dice(): fnc_dice = ${fnc_dice}")

current()

outerFunction("a;b;c" "1;2;3" "x;y;z")
