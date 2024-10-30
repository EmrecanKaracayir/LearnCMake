# TITLE
message("\n*-------*")
message("| LOOPS |")
message("*-------*")

# Basic for loop
message("\n[Basic for loop]")

foreach(item IN ITEMS 0 1 2 3 4 5)
  message("  Loop item: ${item}")
endforeach()

# Loop over a list
message("\n[Loop over a list]")
set(list 0 1 2 3 4 5)

foreach(item IN LISTS list)
  message("  Loop item: ${item}")
endforeach()

# Loop over multiple lists
message("\n[Loop over multiple lists]")
set(list1 0 1 2)
set(list2 3 4 5)

foreach(item IN LISTS list1 list2)
  message("  Loop item: ${item}")
endforeach()

# Loop over multiple lists (zipped)
message("\n[Loop over multiple lists (zipped)]")

foreach(item IN ZIP_LISTS list1 list2)
  message("  Loop items: ${LOOP_ITEM_0} ${LOOP_ITEM_1}")
endforeach()

# Loop over a range
message("\n[Loop over a range]")

foreach(item RANGE 0 5)
  message("  Loop item: ${item}")
endforeach()

# Loop over a range (stepped)
message("\n[Loop over a range (stepped)]")

foreach(item RANGE 0 10 2)
  message("  Loop item: ${item}")
endforeach()

# While loop
message("\n[While loop]")
set(item 0)

while(item LESS_EQUAL 5)
  message("  Loop item: ${item}")
  math(EXPR item "${item} + 1")
endwhile()

# Interrupting a loop
message("\n[Interrupting a loop]")
set(list 0 1 2 3 4 5)

foreach(item IN LISTS list)
  if(item EQUAL 3)
    break()
  endif()
  message("  Loop item: ${item}")
endforeach()
