# >----------< OVERLOADS >-----------------------------------------------------------------------< #

function(set VARIABLE_NAME)
  message("[i]: Setting ${VARIABLE_NAME} to ${ARGN}")
  _set(${VARIABLE_NAME} ${ARGN})
  return(PROPAGATE ${VARIABLE_NAME})
endfunction()
