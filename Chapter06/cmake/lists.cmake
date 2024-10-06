# TITLE
message("\n*-------*")
message("| LISTS |")
message("*-------*")

# List declaration
message("\n[List declaration]")
set(CH06_VAR_LIST "value1" "value2" "value3")
message("  CH06_VAR_LIST: ${CH06_VAR_LIST}")

# List command usages
message("\n[List command usages]")
message("  CH06_VAR_LIST: ${CH06_VAR_LIST}")
list(LENGTH CH06_VAR_LIST CH06_VAR_LIST_LENGTH)
message("  Length: ${CH06_VAR_LIST_LENGTH}")
list(GET CH06_VAR_LIST 1 CH06_VAR_LIST_INDEX)
message("  Index 1: ${CH06_VAR_LIST_INDEX}")
list(FIND CH06_VAR_LIST "value2" CH06_VAR_LIST_INDEX)
message("  Find \"value2\": ${CH06_VAR_LIST_INDEX}")
list(JOIN CH06_VAR_LIST "**" CH06_VAR_LIST_JOINED)
message("  Joined with \"**\": ${CH06_VAR_LIST_JOINED}")

# List additions
message("\n[List additions]")
list(INSERT CH06_VAR_LIST 1 "value2")
message("  Insert \"value2\" at index 1: ${CH06_VAR_LIST}")
list(APPEND CH06_VAR_LIST "value4")
message("  Append \"value4\": ${CH06_VAR_LIST}")
list(PREPEND CH06_VAR_LIST "value0")
message("  Prepend \"value0\": ${CH06_VAR_LIST}")
message("  After additions: ${CH06_VAR_LIST}")

# List removals
message("\n[List removals]")
list(REMOVE_ITEM CH06_VAR_LIST "value3")
message("  Remove \"value3\": ${CH06_VAR_LIST}")
list(REMOVE_AT CH06_VAR_LIST 1)
message("  Remove index 1: ${CH06_VAR_LIST}")
list(REMOVE_DUPLICATES CH06_VAR_LIST)
message("  Remove duplicates: ${CH06_VAR_LIST}")
list(POP_BACK CH06_VAR_LIST CH06_VAR_LIST_POP)
message("  Pop back: ${CH06_VAR_LIST_POP}")
list(POP_FRONT CH06_VAR_LIST CH06_VAR_LIST_POP)
message("  Pop front: ${CH06_VAR_LIST_POP}")
message("  After removals: ${CH06_VAR_LIST}")
