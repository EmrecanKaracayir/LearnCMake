#include "Geometry/Rectangle.hpp"

#include <Math/addition.hpp>
#include <Math/multiplication.hpp>

namespace Geometry
{
  Rectangle::Rectangle(double width, double height) noexcept
    : m_width{ width }
    , m_height{ height }
  {}

  auto Rectangle::area() const noexcept -> double
  {
    return Math::multiply(m_width, m_height);
  }
}
