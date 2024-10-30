# TITLE
message("\n*---------*")
message("| STRINGS |")
message("*---------*")

# Finding substring
message("\n[Finding substring]")
message("  Original: Hello, World!")
string(FIND "Hello, World!" "World" stringIndex)
message("  Index: ${stringIndex}")
string(FIND "Hello, World!" "World" stringIndexReversed)
message("  Reversed index: ${stringIndexReversed}")
string(FIND "Hello, World!" "XXX" stringNotFound)
message("  Not found index: ${stringNotFound}")

# Replacing substring
message("\n[Replacing substring]")
message("  Original: Hello, World!")
string(REPLACE "World" "CMake" stringReplaced "Hello, World!")
message("  Replaced: ${stringReplaced}")

# Regular expressions
message("\n[Regular expressions]")
message("  Original: Hello, World!")
string(REGEX MATCH "World" stringRegexMatched "Hello, World!")
message("  Matched: ${stringRegexMatched}")
string(REGEX MATCHALL "l" stringRegexAllMatched "Hello, World!")
message("  Matched all: ${stringRegexAllMatched}")
string(REGEX REPLACE "World" "CMake" stringRegexReplaced "Hello, World!")
message("  Replaced: ${stringRegexReplaced}")

# Substring
message("\n[Substring]")
message("  Original: Hello, World!")
string(SUBSTRING "Hello, World!" 7 5 substring)
message("  Substring: ${substring}")
string(SUBSTRING "Hello, World!" 7 -1 substringEnd)
message("  Substring end: ${substringEnd}")

# Length
message("\n[Length]")
message("  Original: Hello, World!")
string(LENGTH "Hello, World!" stringLength)
message("  Length: ${stringLength}")

# To upper case and lower case
message("\n[To upper case and lower case]")
message("  Original: Hello, World!")
string(TOUPPER "Hello, World!" stringUpper)
message("  Upper case: ${stringUpper}")
string(TOLOWER "Hello, World!" stringLower)
message("  Lower case: ${stringLower}")

# Strip
message("\n[Strip]")
message("  Original:  Hello, World! ")
string(STRIP " Hello, World! " stringTrimmed)
message("  Stripped: ${stringTrimmed}")
