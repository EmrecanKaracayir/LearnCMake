# >----------< PROJECT : Chapter12 >-------------------------------------------------------------< #

project(PChapter12 VERSION ${SChapter12_VERSION} LANGUAGES CXX)

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

  message("\n[CheckSourceCompiles | hasSomeMacro]")
  check_source_compiles(
    CXX
    [=[
    #ifndef SOME_MACRO
      #error "SOME_MACRO is not defined!"
    #endif
    ]=]
    hasSomeMacro
  )
endblock()

block()
  include(CheckSourceRuns)

  set(CMAKE_REQUIRED_DEFINITIONS [[-DCMAKE="CMake"]])

  message("\n[CheckSourceRuns | mainRuns]")
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
    mainRuns
  )
endblock()
