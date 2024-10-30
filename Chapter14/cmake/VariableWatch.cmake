set(variableToWatch "This is a variable.")

variable_watch(variableToWatch)

set(variableToWatch "This is a new value.")

unset(variableToWatch)

set(variableToCustomWatch "This is a variable.")

function(watchChanges VAR_NAME ACCESS VALUE FILE LIST_FILE_STACK)
  if(ACCESS MATCHES "MODIFIED")
    message(
      NOTICE
      "Watched variable: ${VAR_NAME}\n"
      " value: '${VALUE}'\n"
      " accessed from file: '${FILE}'\n"
      " list file stack: ${LIST_FILE_STACK}"
    )
  elseif(ACCESS MATCHES "REMOVED")
    message(
      NOTICE
      "Watched variable: ${VAR_NAME}\n"
      " destroyed\n"
      " accessed from file: '${FILE}'\n"
      " list file stack: ${LIST_FILE_STACK}"
    )
  endif()
endfunction()

variable_watch(variableToCustomWatch watchChanges)

set(variableToCustomWatch "This is a new value.")

unset(variableToCustomWatch)
