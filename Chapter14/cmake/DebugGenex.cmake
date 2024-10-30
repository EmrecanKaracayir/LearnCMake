add_custom_target(
  genex0 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | 0]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<0:This will not be printed$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<0:This will not be printed>"
  VERBATIM
)
