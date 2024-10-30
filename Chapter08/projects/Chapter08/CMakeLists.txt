# >----------< PROJECT : Chapter08 >-------------------------------------------------------------< #

project(PChapter08 VERSION ${SChapter08_VERSION} LANGUAGES NONE)

# >----------< CONDTIONS >-----------------------------------------------------------------------< #

message("\n[SUBDIR | Conditions]")
message("  PROJECT_IS_TOP_LEVEL    > ${PROJECT_IS_TOP_LEVEL}")
message("  SChapter08_IS_TOP_LEVEL > ${SChapter08_IS_TOP_LEVEL}")
message("  PChapter08_IS_TOP_LEVEL > ${PChapter08_IS_TOP_LEVEL}")

# >----------< PATHS >---------------------------------------------------------------------------< #

message("\n[SUBDIR | Paths]")
message("  CMAKE_SOURCE_DIR         > ${CMAKE_SOURCE_DIR}")
message("  CMAKE_BINARY_DIR         > ${CMAKE_BINARY_DIR}")
message("  CMAKE_CURRENT_SOURCE_DIR > ${CMAKE_CURRENT_SOURCE_DIR}")
message("  CMAKE_CURRENT_BINARY_DIR > ${CMAKE_CURRENT_BINARY_DIR}")

message("\n[SUBDIR | Project paths]")
message("  PROJECT_SOURCE_DIR    > ${PROJECT_SOURCE_DIR}")
message("  PROJECT_BINARY_DIR    > ${PROJECT_BINARY_DIR}")
message("  SChapter08_SOURCE_DIR > ${SChapter08_SOURCE_DIR}")
message("  SChapter08_BINARY_DIR > ${SChapter08_BINARY_DIR}")
message("  PChapter08_SOURCE_DIR > ${PChapter08_SOURCE_DIR}")
message("  PChapter08_BINARY_DIR > ${PChapter08_BINARY_DIR}")

# >----------< VARIABLES >-----------------------------------------------------------------------< #

message("\n[SUBDIR | Variables]")
set(varSubDir "created in subdir")
message("  [create] varSubDir < ${varSubDir}")
message("  [access] varTopDir > ${varTopDir}")
set(varTopDir "updated in subdir")
message("  [update] varTopDir < ${varTopDir} // Updated in subdir")
message("  [access] parTopDir > ${parTopDir}")
set(parTopDir "updated in subdir")
set(parTopDir "updated in subdir" PARENT_SCOPE)
message("  [update] parTopDir < ${parTopDir} // Updated in both scopes")
set(prpTopDir "updated in subdir")
message("  [update] prpTopDir < ${prpTopDir} // Updated in subdir")
set(varIncDir "updated in subdir")
set(varIncDir "updated in subdir" PARENT_SCOPE)
message("  [update] varIncDir < ${varIncDir} // Updated in both scopes")

# >----------< RETURN >--------------------------------------------------------------------------< #

message("\n[SUBDIR | Return (propagate)]")
message("  prpTopDir <-> ${prpTopDir}")
return(PROPAGATE prpTopDir)
