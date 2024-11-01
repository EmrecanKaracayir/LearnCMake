#include <iostream>
#include <cstdlib>

auto main() -> int
{
  std::cout << "Hello, CMake!\n";
  std::cout << "Build Type: " << BUILD_TYPE << '\n';
  return EXIT_SUCCESS;
}
