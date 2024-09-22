#pragma once

#include <ostream>

namespace Geometry
{
  /**
   * @brief   Represents a rectangle.
   */
  class Rectangle
  {
  public:
    /**
     * @brief Constructs a rectangle.
     * @param width The width of the rectangle.
     * @param height The height of the rectangle.
     */
    Rectangle(double width, double height) noexcept;

    /**
     * @brief   Calculates the area of the rectangle.
     * @returns The area of the rectangle.
     */
    [[nodiscard]] auto area() const noexcept -> double;

    /**
     * @brief   Prints the rectangle to the output stream.
     * @param   os The output stream.
     * @param   rectangle The rectangle to print.
     * @returns The output stream.
     */
    friend auto operator<<(std::ostream& os, const Rectangle& rectangle) -> std::ostream&
    {
      os << "Rectangle: Width = " << rectangle.m_width
        << ", Height = " << rectangle.m_height << ", Area = " << rectangle.area();
      return os;
    }
  private:
    double m_width{};
    double m_height{};
  };
}
