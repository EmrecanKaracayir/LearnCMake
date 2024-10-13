# >----------< PROJECT : Chapter05 >-------------------------------------------------------------< #

project(PRJ_Chapter12)

# >----------< TARGET : Chapter12 >--------------------------------------------------------------< #

add_executable(Chapter12)

target_sources(
  Chapter12
  PRIVATE
    "source/main.cpp"
)

# >----------< CHEKCS >--------------------------------------------------------------------------< #

block()
  include(CheckSourceCompiles)

  set(CMAKE_REQUIRED_DEFINITIONS "-DSOME_MACRO")
  set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

  message("\n[CheckSourceCompiles | HAS_SOME_MACRO]")
  check_source_compiles(
    CXX
    [=[
    #ifndef SOME_MACRO
      #error "SOME_MACRO is not defined!"
    #endif
    ]=]
    HAS_SOME_MACRO
  )
endblock()

block()
  include(CheckSourceRuns)

  set(CMAKE_REQUIRED_DEFINITIONS [[-DCMAKE="CMake"]])

  message("\n[CheckSourceRuns | MAIN_RUNS]")
  check_source_runs(
    CXX
    [=[
    #include <iostream>

    int main()
    {
      std::cout << "Hello, " << CMAKE << "!\n";
      return 0;
    }
    ]=]
    MAIN_RUNS
  )
endblock()
