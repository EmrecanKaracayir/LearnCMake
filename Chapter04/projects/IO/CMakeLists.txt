# >----------< PROJECT : IO >--------------------------------------------------------------------< #

project(PRJ_IO)

# >----------< TARGET : IO >---------------------------------------------------------------------< #

add_library(IO INTERFACE)

target_sources(
  IO
  INTERFACE
    FILE_SET api
    TYPE HEADERS
    BASE_DIRS "include"
    FILES
      "include/IO/input.hpp"
      "include/IO/output.hpp"
)
