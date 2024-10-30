# >----------< INCLUDE GUARD >-------------------------------------------------------------------< #

message("\n[INCDIR | Include guard]")
message("  This message will be displayed every time")
include_guard()
message("  This message will be displayed only once")

# >----------< CONDTIONS >-----------------------------------------------------------------------< #

message("\n[INCDIR | Conditions]")
message("  PROJECT_IS_TOP_LEVEL    > ${PROJECT_IS_TOP_LEVEL}")
message("  SChapter08_IS_TOP_LEVEL > ${SChapter08_IS_TOP_LEVEL}")

# >----------< PATHS >---------------------------------------------------------------------------< #

message("\n[INCDIR | Paths]")
message("  CMAKE_SOURCE_DIR         > ${CMAKE_SOURCE_DIR}")
message("  CMAKE_BINARY_DIR         > ${CMAKE_BINARY_DIR}")
message("  CMAKE_CURRENT_SOURCE_DIR > ${CMAKE_CURRENT_SOURCE_DIR}")
message("  CMAKE_CURRENT_BINARY_DIR > ${CMAKE_CURRENT_BINARY_DIR}")

message("\n[INCDIR | List paths]")
message("  CMAKE_CURRENT_LIST_DIR  > ${CMAKE_CURRENT_LIST_DIR}")
message("  CMAKE_CURRENT_LIST_FILE > ${CMAKE_CURRENT_LIST_FILE}")
message("  CMAKE_CURRENT_LIST_LINE > ${CMAKE_CURRENT_LIST_LINE}")

message("\n[INCDIR | Project paths]")
message("  PROJECT_SOURCE_DIR    > ${PROJECT_SOURCE_DIR}")
message("  PROJECT_BINARY_DIR    > ${PROJECT_BINARY_DIR}")
message("  SChapter08_SOURCE_DIR > ${SChapter08_SOURCE_DIR}")
message("  SChapter08_BINARY_DIR > ${SChapter08_BINARY_DIR}")

# >----------< VARIABLES >-----------------------------------------------------------------------< #

message("\n[INCDIR | Variables]")
set(varIncDir "created in incdir")
message("  [create] varIncDir < ${varIncDir}")

# >----------< RETURN >--------------------------------------------------------------------------< #

message("\n[INCDIR | Return]")
message("  This message will be displayed")
return()
message("  This message will not be displayed")
