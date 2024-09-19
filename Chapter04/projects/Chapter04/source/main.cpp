#include <Geometry/Rectangle.hpp>
#include <IO/output.hpp>
#include <Log/log.hpp>
#include <Math/division.hpp>
#include <Statistics/average.hpp>

#include <cstdlib>
#include <format>
#include <iostream>
#include <vector>

auto main() -> int
{
  Log::log("Creating four rectangles...");
  Geometry::Rectangle rectangle1{1.0, 2.0};
  Geometry::Rectangle rectangle2{3.0, 4.0};
  Geometry::Rectangle rectangle3{5.0, 6.0};
  Geometry::Rectangle rectangle4{7.0, 8.0};
  std::cout << "    Rectangle1: " << rectangle1 << '\n';
  std::cout << "    Rectangle2: " << rectangle2 << '\n';
  std::cout << "    Rectangle3: " << rectangle3 << '\n';
  std::cout << "    Rectangle4: " << rectangle4 << '\n';
  IO::writeLine("");

  Log::log("Calculating the areas of the rectangles...");
  const auto area1{rectangle1.area()};
  const auto area2{rectangle2.area()};
  const auto area3{rectangle3.area()};
  const auto area4{rectangle4.area()};
  IO::writeLine(std::format("    Rectangle1: Area = {}", area1));
  IO::writeLine(std::format("    Rectangle2: Area = {}", area2));
  IO::writeLine(std::format("    Rectangle3: Area = {}", area3));
  IO::writeLine(std::format("    Rectangle4: Area = {}", area4));
  IO::writeLine("");

  Log::log("Calculating the average area of the rectangles...");
  const auto averageArea{Statistics::average(std::vector{area1, area2, area3, area4})};
  IO::writeLine(std::format("    Average area: {}", averageArea));
  IO::writeLine("");

  Log::log("Calculating the ratio of the average area to the area of the rectangles...");
  IO::writeLine(std::format("    Area1 / Average = {}", Math::divide(area1, averageArea)));
  IO::writeLine(std::format("    Area2 / Average = {}", Math::divide(area2, averageArea)));
  IO::writeLine(std::format("    Area3 / Average = {}", Math::divide(area3, averageArea)));
  IO::writeLine(std::format("    Area4 / Average = {}", Math::divide(area4, averageArea)));

  return EXIT_SUCCESS;
}
