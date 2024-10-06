# TITLE
message("\n*--------*")
message("| CACHES |")
message("*--------*")

# String cache declaration
message("\n[String cache declaration]")
set(CH06_CACHE_BASIC "value" CACHE STRING "String cache variable")
message("  CH06_CACHE_BASIC: ${CH06_CACHE_BASIC}")

# Bool cache declaration
message("\n[Bool cache declaration]")
set(CH06_CACHE_BOOL TRUE CACHE BOOL "Bool cache variable")
message("  CH06_CACHE_BOOL: ${CH06_CACHE_BOOL}")

# Filepath cache declaration
message("\n[Filepath cache declaration]")
set(CH06_CACHE_FILEPATH "C:/path/to/file.txt" CACHE FILEPATH "Filepath cache variable")
message("  CH06_CACHE_FILEPATH: ${CH06_CACHE_FILEPATH}")

# Path cache declaration
message("\n[Path cache declaration]")
set(CH06_CACHE_PATH "C:/path/to/dir" CACHE PATH "Path cache variable")
message("  CH06_CACHE_PATH: ${CH06_CACHE_PATH}")

# Dropdown cache declaration
message("\n[Dropdown cache declaration]")
set(CH06_CACHE_DROPDOWN "value1" CACHE STRING "Dropdown cache variable" FORCE)
set_property(CACHE CH06_CACHE_DROPDOWN PROPERTY STRINGS "value1" "value2" "value3")
message("  CH06_CACHE_DROPDOWN: ${CH06_CACHE_DROPDOWN}")

# Advanced cache declaration
message("\n[Advanced cache declaration]")
set(CH06_CACHE_ADVANCED "value" CACHE STRING "Advanced cache variable")
mark_as_advanced(CH06_CACHE_ADVANCED)
message("  CH06_CACHE_ADVANCED: ${CH06_CACHE_ADVANCED}")

# Internal cache declaration
message("\n[Internal cache declaration]")
set(CH06_CACHE_INTERNAL "value" CACHE INTERNAL "Internal cache variable")
message("  CH06_CACHE_INTERNAL: ${CH06_CACHE_INTERNAL}")

# Option cache declaration
message("\n[Option cache declaration]")
option(CH06_CACHE_OPTION "Option cache variable" ON)
message("  CH06_CACHE_OPTION: ${CH06_CACHE_OPTION}")
