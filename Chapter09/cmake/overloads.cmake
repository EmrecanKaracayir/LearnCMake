# >----------< OVERLOADS >-----------------------------------------------------------------------< #

function(set variableName)
  message("[i]: Setting ${variableName} to ${ARGN}")
  _set(${variableName} ${ARGN})
  return(PROPAGATE ${variableName})
endfunction()
