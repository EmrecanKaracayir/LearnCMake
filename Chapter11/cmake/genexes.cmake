add_custom_target(
  genex0 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | 0]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<0:This will not be printed$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<0:This will not be printed>"
  VERBATIM
)

add_custom_target(
  genex1 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | 1]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<1:This will be printed$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<1:This will be printed>"
  VERBATIM
)

add_custom_target(
  genexBoolFalse ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | BOOL : FALSE]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<$<BOOL:FALSE$<ANGLE-R>:This will not be printed$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<$<BOOL:FALSE>:This will not be printed>"
  VERBATIM
)

add_custom_target(
  genexBoolTrue ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | BOOL : TRUE]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<$<BOOL:TRUE$<ANGLE-R>:This will be printed$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<$<BOOL:TRUE>:This will be printed>"
  VERBATIM
)

add_custom_target(
  genexLogic0 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | LOGIC : 0]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<$<AND:$<BOOL:TRUE$<ANGLE-R>,$<BOOL:FALSE$<ANGLE-R>$<ANGLE-R>:This will not be printed$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<$<AND:$<BOOL:TRUE>,$<BOOL:FALSE>>:This will not be printed>"
  VERBATIM
)

add_custom_target(
  genexLogic1 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | LOGIC : 1]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<$<OR:$<BOOL:TRUE$<ANGLE-R>,$<BOOL:FALSE$<ANGLE-R>$<ANGLE-R>:This will be printed$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<$<OR:$<BOOL:TRUE>,$<BOOL:FALSE>>:This will be printed>"
  VERBATIM
)

set(ifVar 0)

add_custom_target(
  genexIf0 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | IF : 0]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<IF:${ifVar},true,false$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<IF:${ifVar},true,false>"
  VERBATIM
)

set(ifVar 1)

add_custom_target(
  genexIf1 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | IF : 1]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<IF:${ifVar},true,false$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<IF:${ifVar},true,false>"
  VERBATIM
)

add_custom_target(
  genexEqual0 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | NUMBER : EQUAL : 0]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<IF:$<EQUAL:3,10$<ANGLE-R>,Numbers are equal,Numbers are not equal$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<IF:$<EQUAL:3,10>,Numbers are equal,Numbers are not equal>"
  VERBATIM
)

add_custom_target(
  genexEqual1 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | NUMBER : EQUAL : 1]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<IF:$<EQUAL:10,10$<ANGLE-R>,Numbers are equal,Numbers are not equal$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<IF:$<EQUAL:10,10>,Numbers are equal,Numbers are not equal>"
  VERBATIM
)

add_custom_target(
  genexStrEqual0 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | STRING : EQUAL : 0]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<IF:$<STREQUAL:STR,NOSTR$<ANGLE-R>,Strings are equal,Strings are not equal$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<IF:$<STREQUAL:STR,NOSTR>,Strings are equal,Strings are not equal>"
  VERBATIM
)

add_custom_target(
  genexStrEqual1 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | STRING : EQUAL : 1]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<IF:$<STREQUAL:STR,STR$<ANGLE-R>,Strings are equal,Strings are not equal$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<IF:$<STREQUAL:STR,STR>,Strings are equal,Strings are not equal>"
  VERBATIM
)

add_custom_target(
  genexVersionEqual0 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | VERSION : EQUAL : 0]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<IF:$<VERSION_EQUAL:3.0.1,9.0.2$<ANGLE-R>,Versions are equal,Versions are not equal$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<IF:$<VERSION_EQUAL:3.0.1,9.0.2>,Versions are equal,Versions are not equal>"
  VERBATIM
)

add_custom_target(
  genexVersionEqual1 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | VERSION : EQUAL : 1]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<IF:$<VERSION_EQUAL:9.0.2,9.0.2$<ANGLE-R>,Versions are equal,Versions are not equal$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<IF:$<VERSION_EQUAL:9.0.2,9.0.2>,Versions are equal,Versions are not equal>"
  VERBATIM
)

add_custom_target(
  genexConfig ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | CONFIG : Debug]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<IF:$<CONFIG:Debug$<ANGLE-R>,Config is 'Debug',Config is not 'Debug'$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<IF:$<CONFIG:Debug>,Config is 'Debug',Config is not 'Debug'>"
  VERBATIM
)

set(list "A;B;C")

add_custom_target(
  genexList0 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | LIST : 0]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<IN_LIST:X,${list}$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<IN_LIST:X,${list}>"
  VERBATIM
)

add_custom_target(
  genexList1 ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | LIST : 1]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<IN_LIST:A,${list}$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<IN_LIST:A,${list}>"
  VERBATIM
)

add_custom_target(
  genexListAppend ALL
  COMMAND ${CMAKE_COMMAND} -E echo ""
  COMMAND ${CMAKE_COMMAND} -E echo "[Genex | LIST : APPEND]"
  COMMAND ${CMAKE_COMMAND} -E echo "  Expression: $<LIST:APPEND,${list},D$<ANGLE-R>"
  COMMAND ${CMAKE_COMMAND} -E echo "  Result: $<LIST:APPEND,${list},D>"
  VERBATIM
)
