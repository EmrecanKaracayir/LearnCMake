#pragma once

#include <vector>

namespace Statistics
{
  /**
   * @brief   Calculates the average of a collection of numbers.
   * @param   numbers The collection of numbers.
   * @returns The average of the numbers.
   */
  [[nodiscard]] auto average(const std::vector<double>& numbers) noexcept -> double;
}
