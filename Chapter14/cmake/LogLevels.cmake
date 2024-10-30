# >----------< FUNCTIONS >-----------------------------------------------------------------------< #

function(printLogs)
  # FATAL_ERROR
  # message(FATAL_ERROR "This is a fatal error message. It is used when the error is so severe that CMake must stop processing and exit.")

  # SEND_ERROR
  # message(SEND_ERROR "This is a send error message. It is used when the error is severe enough to prevent the generation of the build system.")

  # WARNING
  message(WARNING "This is a warning message. It is used when the user should be aware of a condition that is not an error.")

  # AUTHOR_WARNING
  message(AUTHOR_WARNING "This is an author warning message. It is used when the developer should be aware of a condition that is not an error.")

  # DEPRECATION
  message(DEPRECATION "This is a deprecation message. It is used when the developer should be aware of a deprecated feature.")

  # NOTICE
  message(NOTICE "This is a notice message. It is used when there is no action required, but the user should be aware of a condition.")

  # STATUS
  message(STATUS "This is a status message. It is used to provide information about the progress of the build system.")

  # VERBOSE
  message(VERBOSE "This is a verbose message. It is used to provide detailed information about the progress of the build system.")

  # DEBUG
  message(DEBUG "This is a debug message. It is used to provide detailed information about the progress of the build system for debugging purposes.")

  # TRACE
  message(TRACE "This is a trace message. It is used to provide detailed information about the progress of the build system for debugging purposes.")
endfunction()

# >----------< CALLS >---------------------------------------------------------------------------< #

printLogs()
