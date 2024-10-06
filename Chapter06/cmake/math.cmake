# TITLE
message("\n*------*")
message("| MATH |")
message("*------*")

# Define variables
message("\n[Define variables]")
set(CH06_VAR_MATH_X 10)
message("  CH06_VAR_MATH_X: ${CH06_VAR_MATH_X}")
set(CH06_VAR_MATH_Y 5)
message("  CH06_VAR_MATH_Y: ${CH06_VAR_MATH_Y}")

# Basic operations
message("\n[Basic operations]")
math(EXPR CH06_VAR_MATH_ADD "${CH06_VAR_MATH_X} + ${CH06_VAR_MATH_Y}")
message("  \"X\" + \"Y\": ${CH06_VAR_MATH_ADD}")
math(EXPR CH06_VAR_MATH_SUB "${CH06_VAR_MATH_X} - ${CH06_VAR_MATH_Y}")
message("  \"X\" - \"Y\": ${CH06_VAR_MATH_SUB}")
math(EXPR CH06_VAR_MATH_MUL "${CH06_VAR_MATH_X} * ${CH06_VAR_MATH_Y}")
message("  \"X\" * \"Y\": ${CH06_VAR_MATH_MUL}")
math(EXPR CH06_VAR_MATH_DIV "${CH06_VAR_MATH_X} / ${CH06_VAR_MATH_Y}")
message("  \"X\" / \"Y\": ${CH06_VAR_MATH_DIV}")

# Basic operations (hexadecimal)
message("\n[Basic operations (hexadecimal)]")
math(EXPR CH06_VAR_MATH_HEX_ADD "${CH06_VAR_MATH_X} + ${CH06_VAR_MATH_Y}" OUTPUT_FORMAT HEXADECIMAL)
message("  \"X\" + \"Y\": ${CH06_VAR_MATH_HEX_ADD}")
math(EXPR CH06_VAR_MATH_HEX_SUB "${CH06_VAR_MATH_X} - ${CH06_VAR_MATH_Y}" OUTPUT_FORMAT HEXADECIMAL)
message("  \"X\" - \"Y\": ${CH06_VAR_MATH_HEX_SUB}")
math(EXPR CH06_VAR_MATH_HEX_MUL "${CH06_VAR_MATH_X} * ${CH06_VAR_MATH_Y}" OUTPUT_FORMAT HEXADECIMAL)
message("  \"X\" * \"Y\": ${CH06_VAR_MATH_HEX_MUL}")
math(EXPR CH06_VAR_MATH_HEX_DIV "${CH06_VAR_MATH_X} / ${CH06_VAR_MATH_Y}" OUTPUT_FORMAT HEXADECIMAL)
message("  \"X\" / \"Y\": ${CH06_VAR_MATH_HEX_DIV}")
