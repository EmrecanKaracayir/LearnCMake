# TITLE
message("\n*--------*")
message("| SCOPES |")
message("*--------*")

# Directory scope
message("\n[Directory scope]")
set(varDirectory "value")
message("  varDirectory: ${varDirectory}")

# Basic scope block
message("\n[Basic scope block]")

block()
  message("  LOCAL SCOPE {")
  set(varBlock "value")
  message("    varBlock: ${varBlock}")
  message("  }")
endblock()

message("  varBlock: ${varBlock}")

# Modifiying global variable inside scope block
message("\n[Modifiying global variable inside scope block]")
set(var "value")
message("  var: ${var}")

block()
  message("  LOCAL SCOPE {")
  set(var "new value" PARENT_SCOPE)
  message("    var: ${var}")
  message("  }")
endblock()

message("  var: ${var}")

# Propagating variable from scope block
message("\n[Propagating variable from scope block]")
set(varPropagated "value")
message("  varPropagated: ${varPropagated}")

block(PROPAGATE varPropagated)
  message("  LOCAL SCOPE {")
  set(varPropagated "new value")
  message("    varPropagated: ${varPropagated}")
  message("  }")
endblock()

message("  varPropagated: ${varPropagated}")

# Different scope blocks
message("\n[Different scope blocks]")

block(SCOPE_FOR VARIABLES)
  message("  LOCAL SCOPE FOR VARIABLES {")
  set(varLocal "value")
  message("    varLocal: ${varLocal}")
  message("  }")
endblock()

block(SCOPE_FOR POLICIES)
  message("  LOCAL SCOPE FOR POLICIES {")
  set(CMAKE_POLICY_DEFAULT_CMP0077 NEW)
  message("    CMAKE_POLICY_DEFAULT_CMP0077: ${CMAKE_POLICY_DEFAULT_CMP0077}")
  message("  }")
endblock()
