# TITLE
message("\n*--------*")
message("| SCOPES |")
message("*--------*")

# Directory scope
message("\n[Directory scope]")
set(CH06_VAR_DIRECTORY "value")
message("  CH06_VAR_DIRECTORY: ${CH06_VAR_DIRECTORY}")

# Basic scope block
message("\n[Basic scope block]")

block()
  message("  LOCAL SCOPE {")
  set(CH06_VAR_BLOCK "value")
  message("    CH06_VAR_BLOCK: ${CH06_VAR_BLOCK}")
  message("  }")
endblock()

message("  CH06_VAR_BLOCK: ${CH06_VAR_BLOCK}")

# Modifiying global variable inside scope block
message("\n[Modifiying global variable inside scope block]")
set(CH06_VAR_DIRECTORY2 "value")
message("  CH06_VAR_DIRECTORY2: ${CH06_VAR_DIRECTORY2}")

block()
  message("  LOCAL SCOPE {")
  set(CH06_VAR_DIRECTORY2 "new value" PARENT_SCOPE)
  message("    CH06_VAR_DIRECTORY2: ${CH06_VAR_DIRECTORY2}")
  message("  }")
endblock()

message("  CH06_VAR_DIRECTORY2: ${CH06_VAR_DIRECTORY2}")

# Propagating variable from scope block
message("\n[Propagating variable from scope block]")
set(CH06_VAR_PROPAGATE "value")
message("  CH06_VAR_PROPAGATE: ${CH06_VAR_PROPAGATE}")

block(PROPAGATE CH06_VAR_PROPAGATE)
  message("  LOCAL SCOPE {")
  set(CH06_VAR_PROPAGATE "new value")
  message("    CH06_VAR_PROPAGATE: ${CH06_VAR_PROPAGATE}")
  message("  }")
endblock()

message("  CH06_VAR_PROPAGATE: ${CH06_VAR_PROPAGATE}")

# Different scope blocks
message("\n[Different scope blocks]")

block(SCOPE_FOR VARIABLES)
  message("  LOCAL SCOPE FOR VARIABLES {")
  set(CH06_VAR_SCOPE "value")
  message("    CH06_VAR_SCOPE: ${CH06_VAR_SCOPE}")
  message("  }")
endblock()

block(SCOPE_FOR POLICIES)
  message("  LOCAL SCOPE FOR POLICIES {")
  set(CMAKE_POLICY_DEFAULT_CMP0077 NEW)
  message("    CMAKE_POLICY_DEFAULT_CMP0077: ${CMAKE_POLICY_DEFAULT_CMP0077}")
  message("  }")
endblock()
