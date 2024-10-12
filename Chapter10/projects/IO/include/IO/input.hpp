#pragma once

#include <string>
#include <iostream>

namespace IO
{
  /**
   * @brief   Read a value from the standard input.
   * @tparam  T The type of the value to read.
   * @returns The value read from the standard input.
   */
  template <typename T>
  [[nodiscard]] auto read() -> T;

  /**
   * @brief   Read a line from the standard input.
   * @returns The line read from the standard input.
   */
  [[nodiscard]] inline auto readLine() -> std::string;
}

/*------------------------------------------------------------------------------------------------*\
*| <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Implementation >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> |*
\*------------------------------------------------------------------------------------------------*/

namespace IO
{
  template <typename T>
  [[nodiscard]] auto read() -> T
  {
    T value;
    std::cin >> value;
    return value;
  }

  [[nodiscard]] inline auto readLine() -> std::string
  {
    std::string line;
    std::getline(std::cin, line);
    return line;
  }
}
