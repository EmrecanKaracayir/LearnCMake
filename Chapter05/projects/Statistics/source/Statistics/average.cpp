#include "Statistics/average.hpp"

#include <vector>

namespace Statistics
{
  auto average(const std::vector<double>& numbers) noexcept -> double
  {
    if (numbers.empty())
    {
      return 0.0;
    }

    double sum{};
    for (const auto number : numbers)
    {
      sum += number;
    }

    return sum / numbers.size();
  }
}
