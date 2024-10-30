# TITLE
message("\n*------*")
message("| MATH |")
message("*------*")

# Define variables
message("\n[Define variables]")
set(x 10)
message("  CH06_VAR_MATH_X: ${x}")
set(y 5)
message("  CH06_VAR_MATH_Y: ${y}")

# Basic operations
message("\n[Basic operations]")
math(EXPR added "${x} + ${y}")
message("  \"X\" + \"Y\": ${added}")
math(EXPR subtracted "${x} - ${y}")
message("  \"X\" - \"Y\": ${subtracted}")
math(EXPR multiplied "${x} * ${y}")
message("  \"X\" * \"Y\": ${multiplied}")
math(EXPR divided "${x} / ${y}")
message("  \"X\" / \"Y\": ${divided}")

# Basic operations (hexadecimal)
message("\n[Basic operations (hexadecimal)]")
math(EXPR hexAdded "${x} + ${y}" OUTPUT_FORMAT HEXADECIMAL)
message("  \"X\" + \"Y\": ${hexAdded}")
math(EXPR hexSubtracted "${x} - ${y}" OUTPUT_FORMAT HEXADECIMAL)
message("  \"X\" - \"Y\": ${hexSubtracted}")
math(EXPR hexMultiplied "${x} * ${y}" OUTPUT_FORMAT HEXADECIMAL)
message("  \"X\" * \"Y\": ${hexMultiplied}")
math(EXPR hexDivided "${x} / ${y}" OUTPUT_FORMAT HEXADECIMAL)
message("  \"X\" / \"Y\": ${hexDivided}")
