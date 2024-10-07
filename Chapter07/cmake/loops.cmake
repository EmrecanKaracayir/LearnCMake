# TITLE
message("\n*-------*")
message("| LOOPS |")
message("*-------*")

# Basic for loop
message("\n[Basic for loop]")

foreach(LOOP_ITEM IN ITEMS 0 1 2 3 4 5)
  message("  Loop item: ${LOOP_ITEM}")
endforeach()

# Loop over a list
message("\n[Loop over a list]")
set(LOOP_LIST 0 1 2 3 4 5)

foreach(LOOP_ITEM IN LISTS LOOP_LIST)
  message("  Loop item: ${LOOP_ITEM}")
endforeach()

# Loop over multiple lists
message("\n[Loop over multiple lists]")
set(LOOP_LIST_1 0 1 2)
set(LOOP_LIST_2 3 4 5)

foreach(LOOP_ITEM IN LISTS LOOP_LIST_1 LOOP_LIST_2)
  message("  Loop item: ${LOOP_ITEM}")
endforeach()

# Loop over multiple lists (zipped)
message("\n[Loop over multiple lists (zipped)]")

foreach(LOOP_ITEM IN ZIP_LISTS LOOP_LIST_1 LOOP_LIST_2)
  message("  Loop items: ${LOOP_ITEM_0} ${LOOP_ITEM_1}")
endforeach()

# Loop over a range
message("\n[Loop over a range]")

foreach(LOOP_ITEM RANGE 0 5)
  message("  Loop item: ${LOOP_ITEM}")
endforeach()

# Loop over a range (stepped)
message("\n[Loop over a range (stepped)]")

foreach(LOOP_ITEM RANGE 0 10 2)
  message("  Loop item: ${LOOP_ITEM}")
endforeach()

# While loop
message("\n[While loop]")
set(LOOP_ITEM 0)

while(LOOP_ITEM LESS_EQUAL 5)
  message("  Loop item: ${LOOP_ITEM}")
  math(EXPR LOOP_ITEM "${LOOP_ITEM} + 1")
endwhile()

# Interrupting a loop
message("\n[Interrupting a loop]")
set(LOOP_LIST 0 1 2 3 4 5)

foreach(LOOP_ITEM IN LISTS LOOP_LIST)
  if(LOOP_ITEM EQUAL 3)
    break()
  endif()
  message("  Loop item: ${LOOP_ITEM}")
endforeach()
