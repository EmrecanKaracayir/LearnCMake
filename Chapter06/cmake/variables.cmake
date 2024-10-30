# TITLE
message("\n*-----------*")
message("| VARIABLES |")
message("*-----------*")

# Basic variable declaration
message("\n[Basic variable declaration]")
set(var "value")
message("  var: ${var}")

# List variable declaration
message("\n[List variable declaration]")
set(list "value1" "value2" "value3")
message("  list: ${list}")

# List variable declaration (alt)
message("\n[List variable declaration (alt)]")
set(listAlt "value1;value2;value3")
message("  listAlt: ${listAlt}")

# Example variable usages
message("\n[Example variable usages]")
set(abVar "ab")
message("  abVar: ${abVar}")
set(cdVar "cd")
message("  cdVar: ${cdVar}")
set(abcdVar "${abVar}${cdVar}")
message("  abcdVar: ${abcdVar}")
set(ab_cdVar "${abVar}" "${cdVar}")
message("  ab_cdVar: ${ab_cdVar}")

# Multiline variable declaration
message("\n[Multiline variable declaration]")
set(varMultiline "value1\nvalue2\nvalue3")
message("  varMultiline: ${varMultiline}")

# Multiline variable declaration (alt 1)
message("\n[Multiline variable declaration (alt 1)]")
set(varMultilineAlt
"value1
value2
value3"
)
message("  varMultilineAlt: ${varMultilineAlt}")

# Multiline variable declaration (alt 2)
message("\n[Multiline variable declaration (alt 2)]")
set(varMultilineBracket
[[value1
value2
value3]]
)
message("  varMultilineBracket: ${varMultilineBracket}")

# Unsetting a variable
message("\n[Unsetting a variable]")
set(varUnset "value")
message("  varUnset: ${varUnset}")
unset(varUnset)
message("  varUnset: ${varUnset}")

# Environment variable declaration
message("\n[Environment variable declaration]")
set(ENV{PATH} "$ENV{PATH}:SOME/VERY/IMPORTANT/PATH")
message("  PATH: $ENV{PATH}")
