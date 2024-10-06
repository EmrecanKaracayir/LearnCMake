# TITLE
message("\n*---------*")
message("| STRINGS |")
message("*---------*")

# Finding substring
message("\n[Finding substring]")
message("  Original: Hello, World!")
string(FIND "Hello, World!" "World" CH06_VAR_STRING_INDEX)
message("  Index: ${CH06_VAR_STRING_INDEX}")
string(FIND "Hello, World!" "World" CH06_VAR_STRING_INDEX_REVERSE)
message("  Reversed index: ${CH06_VAR_STRING_INDEX_REVERSE}")
string(FIND "Hello, World!" "XXX" CH06_VAR_STRING_NOT_FOUND)
message("  Not found index: ${CH06_VAR_STRING_NOT_FOUND}")

# Replacing substring
message("\n[Replacing substring]")
message("  Original: Hello, World!")
string(REPLACE "World" "CMake" CH06_VAR_STRING_REPLACE "Hello, World!")
message("  Replaced: ${CH06_VAR_STRING_REPLACE}")

# Regular expressions
message("\n[Regular expressions]")
message("  Original: Hello, World!")
string(REGEX MATCH "World" CH06_VAR_REGEX_MATCHED "Hello, World!")
message("  Matched: ${CH06_VAR_REGEX_MATCHED}")
string(REGEX MATCHALL "l" CH06_VAR_REGEX_ALL_MATCHED "Hello, World!")
message("  Matched all: ${CH06_VAR_REGEX_ALL_MATCHED}")
string(REGEX REPLACE "World" "CMake" CH06_VAR_REGEX_REPLACED "Hello, World!")
message("  Replaced: ${CH06_VAR_REGEX_REPLACED}")

# Substring
message("\n[Substring]")
message("  Original: Hello, World!")
string(SUBSTRING "Hello, World!" 7 5 CH06_VAR_SUBSTRING)
message("  Substring: ${CH06_VAR_SUBSTRING}")
string(SUBSTRING "Hello, World!" 7 -1 CH06_VAR_SUBSTRING_END)
message("  Substring end: ${CH06_VAR_SUBSTRING_END}")

# Length
message("\n[Length]")
message("  Original: Hello, World!")
string(LENGTH "Hello, World!" CH06_VAR_STRING_LENGTH)
message("  Length: ${CH06_VAR_STRING_LENGTH}")

# To upper case and lower case
message("\n[To upper case and lower case]")
message("  Original: Hello, World!")
string(TOUPPER "Hello, World!" CH06_VAR_STRING_UPPER)
message("  Upper case: ${CH06_VAR_STRING_UPPER}")
string(TOLOWER "Hello, World!" CH06_VAR_STRING_LOWER)
message("  Lower case: ${CH06_VAR_STRING_LOWER}")

# Strip
message("\n[Strip]")
message("  Original:  Hello, World! ")
string(STRIP " Hello, World! " CH06_VAR_STRING_TRIMMED)
message("  Stripped: ${CH06_VAR_STRING_TRIMMED}")
