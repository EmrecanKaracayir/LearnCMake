# TITLE
message("\n*-----------*")
message("| VARIABLES |")
message("*-----------*")

# Basic variable declaration
message("\n[Basic variable declaration]")
set(CH06_VAR_BASIC "value")
message("  CH06_VAR_BASIC: ${CH06_VAR_BASIC}")

# List variable declaration
message("\n[List variable declaration]")
set(CH06_VAR_LIST "value1" "value2" "value3")
message("  CH06_VAR_LIST: ${CH06_VAR_LIST}")

# List variable declaration (alt)
message("\n[List variable declaration (alt)]")
set(CH06_VAR_LIST_ALT "value1;value2;value3")
message("  CH06_VAR_LIST_ALT: ${CH06_VAR_LIST_ALT}")

# Example variable usages
message("\n[Example variable usages]")
set(CH06_VAR_AB "ab")
message("  CH06_VAR_AB: ${CH06_VAR_AB}")
set(CH06_VAR_CD "cd")
message("  CH06_VAR_CD: ${CH06_VAR_CD}")
set(CH06_VAR_ABCD "${CH06_VAR_AB}${CH06_VAR_CD}")
message("  CH06_VAR_ABCD: ${CH06_VAR_ABCD}")
set(CH06_VAR_AB_CD "${CH06_VAR_AB}" "${CH06_VAR_CD}")
message("  CH06_VAR_AB_CD: ${CH06_VAR_AB_CD}")

# Multiline variable declaration
message("\n[Multiline variable declaration]")
set(CH06_VAR_MULTILINE "value1\nvalue2\nvalue3")
message("  CH06_VAR_MULTILINE: ${CH06_VAR_MULTILINE}")

# Multiline variable declaration (alt 1)
message("\n[Multiline variable declaration (alt 1)]")
set(CH06_VAR_MULTILINE_ALT1
"value1
value2
value3"
)
message("  CH06_VAR_MULTILINE_ALT1: ${CH06_VAR_MULTILINE_ALT1}")

# Multiline variable declaration (alt 2)
message("\n[Multiline variable declaration (alt 2)]")
set(CH06_VAR_MULTILINE_ALT2
[[value1
value2
value3]]
)
message("  CH06_VAR_MULTILINE_ALT2: ${CH06_VAR_MULTILINE_ALT2}")

# Unsetting a variable
message("\n[Unsetting a variable]")
set(CH06_VAR_UNSET "value")
message("  CH06_VAR_UNSET: ${CH06_VAR_UNSET}")
unset(CH06_VAR_UNSET)
message("  CH06_VAR_UNSET: ${CH06_VAR_UNSET}")

# Environment variable declaration
message("\n[Environment variable declaration]")
set(ENV{PATH} "$ENV{PATH}:SOME/VERY/IMPORTANT/PATH")
message("  PATH: $ENV{PATH}")
