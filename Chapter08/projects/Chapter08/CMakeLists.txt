# >----------< PROJECT : Chapter08 >-------------------------------------------------------------< #

project(PRJ_Chapter08 LANGUAGES NONE)

# >----------< CONDTIONS >-----------------------------------------------------------------------< #

message("\n[SUBDIR | Conditions]")
message("  PROJECT_IS_TOP_LEVEL       > ${PROJECT_IS_TOP_LEVEL}")
message("  SLN_Chapter08_IS_TOP_LEVEL > ${SLN_Chapter08_IS_TOP_LEVEL}")
message("  PRJ_Chapter08_IS_TOP_LEVEL > ${PRJ_Chapter08_IS_TOP_LEVEL}")

# >----------< PATHS >---------------------------------------------------------------------------< #

message("\n[SUBDIR | Paths]")
message("  CMAKE_SOURCE_DIR         > ${CMAKE_SOURCE_DIR}")
message("  CMAKE_BINARY_DIR         > ${CMAKE_BINARY_DIR}")
message("  CMAKE_CURRENT_SOURCE_DIR > ${CMAKE_CURRENT_SOURCE_DIR}")
message("  CMAKE_CURRENT_BINARY_DIR > ${CMAKE_CURRENT_BINARY_DIR}")

message("\n[SUBDIR | Project paths]")
message("  PROJECT_SOURCE_DIR       > ${PROJECT_SOURCE_DIR}")
message("  PROJECT_BINARY_DIR       > ${PROJECT_BINARY_DIR}")
message("  SLN_Chapter08_SOURCE_DIR > ${SLN_Chapter08_SOURCE_DIR}")
message("  SLN_Chapter08_BINARY_DIR > ${SLN_Chapter08_BINARY_DIR}")
message("  PRJ_Chapter08_SOURCE_DIR > ${PRJ_Chapter08_SOURCE_DIR}")
message("  PRJ_Chapter08_BINARY_DIR > ${PRJ_Chapter08_BINARY_DIR}")

# >----------< VARIABLES >-----------------------------------------------------------------------< #

message("\n[SUBDIR | Variables]")
set(CH08_VAR_SUBDIR "created in subdir")
message("  [create] CH08_VAR_SUBDIR < ${CH08_VAR_SUBDIR}")
message("  [access] CH08_VAR_TOPDIR > ${CH08_VAR_TOPDIR}")
set(CH08_VAR_TOPDIR "updated in subdir")
message("  [update] CH08_VAR_TOPDIR < ${CH08_VAR_TOPDIR} // Updated in subdir")
message("  [access] CH08_VAR_PARENT > ${CH08_VAR_PARENT}")
set(CH08_VAR_PARENT "updated in subdir")
set(CH08_VAR_PARENT "updated in subdir" PARENT_SCOPE)
message("  [update] CH08_VAR_PARENT < ${CH08_VAR_PARENT} // Updated in both scopes")
set(CH08_VAR_PRPGTE "updated in subdir")
message("  [update] CH08_VAR_PARENT < ${CH08_VAR_PRPGTE} // Updated in subdir")
set(CH08_VAR_INCDIR "updated in subdir")
set(CH08_VAR_INCDIR "updated in subdir" PARENT_SCOPE)
message("  [update] CH08_VAR_INCDIR < ${CH08_VAR_INCDIR} // Updated in both scopes")

# >----------< RETURN >--------------------------------------------------------------------------< #

message("\n[SUBDIR | Return (propagate)]")
message("  CH08_VAR_PRPGTE <-> ${CH08_VAR_PRPGTE}")
return(PROPAGATE CH08_VAR_PRPGTE)
