# TITLE
message("\n*-------*")
message("| LISTS |")
message("*-------*")

# List declaration
message("\n[List declaration]")
set(list "value1" "value2" "value3")
message("  basicList: ${list}")

# List command usages
message("\n[List command usages]")
message("  basicList: ${list}")
list(LENGTH list listLength)
message("  Length: ${listLength}")
list(GET list 1 listIndex)
message("  Index 1: ${listIndex}")
list(FIND list "value2" listIndex)
message("  Find \"value2\": ${listIndex}")
list(JOIN list "**" listJoined)
message("  Joined with \"**\": ${listJoined}")

# List additions
message("\n[List additions]")
list(INSERT list 1 "value2")
message("  Insert \"value2\" at index 1: ${list}")
list(APPEND list "value4")
message("  Append \"value4\": ${list}")
list(PREPEND list "value0")
message("  Prepend \"value0\": ${list}")
message("  After additions: ${list}")

# List removals
message("\n[List removals]")
list(REMOVE_ITEM list "value3")
message("  Remove \"value3\": ${list}")
list(REMOVE_AT list 1)
message("  Remove index 1: ${list}")
list(REMOVE_DUPLICATES list)
message("  Remove duplicates: ${list}")
list(POP_BACK list poppedItem)
message("  Pop back: ${poppedItem}")
list(POP_FRONT list poppedItem)
message("  Pop front: ${poppedItem}")
message("  After removals: ${list}")
