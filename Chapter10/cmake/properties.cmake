message("\n[Properties | GLOBAL]")
get_cmake_property(CH10_CACHE_VARIABLES CACHE_VARIABLES)
message("  Cache variables: ${CH10_CACHE_VARIABLES}")

message("\n[Properties | DIRECTORY]")
get_directory_property(CH10_SOURCE_DIR SOURCE_DIR)
message("  Current source directory: ${CH10_SOURCE_DIR}")
set_directory_properties(PROPERTIES LABELS "Chapter10")
message("  Set labels: Chapter10")
get_directory_property(CH10_LABELS LABELS)
message("  Labels: ${CH10_LABELS}")
