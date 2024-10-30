# >----------< FUNCTIONS >-----------------------------------------------------------------------< #

function(funcA)
  message("[Function | A]")
  list(APPEND CMAKE_MESSAGE_INDENT "  ")
  message(NOTICE "This is a message from function A.")
endfunction()

function(funcB)
  message("[Function | B]")
  list(APPEND CMAKE_MESSAGE_INDENT "  ")
  message(NOTICE "This is a message from function B.")
  funcA()
endfunction()

function(funcC)
  message("[Function | C]")
  list(APPEND CMAKE_MESSAGE_INDENT "  ")
  message(NOTICE "This is a message from function C.")
  funcB()
endfunction()

function(funcTop)
  message("\n[Function | Top]")
  list(APPEND CMAKE_MESSAGE_INDENT "  ")
  message(NOTICE "This is a message from the top-level function.")
  funcA()
  funcB()
  funcC()
endfunction()

# >----------< CALLS >---------------------------------------------------------------------------< #

funcTop()
