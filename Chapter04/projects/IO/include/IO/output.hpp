#pragma once

#include <string>
#include <iostream>

namespace IO
{
  /**
   * @brief  Write a value to the standard output.
   * @tparam T The type of the value to write.
   * @param  value The value to write to the standard output.
   */
  template <typename T>
  auto write(const T& value) -> void;

  /**
   * @brief Write a line to the standard output.
   * @param line The line to write to the standard output.
   */
  inline auto writeLine(const std::string& line) -> void;
}

/*------------------------------------------------------------------------------------------------*\
*| <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Implementation >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> |*
\*------------------------------------------------------------------------------------------------*/

namespace IO
{
  template <typename T>
  auto write(const T& value) -> void
  {
    std::cout << value;
  }

  inline auto writeLine(const std::string& line) -> void
  {
    std::cout << line << '\n';
  }
}
