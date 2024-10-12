#pragma once

#include <string>

namespace Log
{
  /**
   * @brief Log a message.
   * @param message The message to log.
   */
  auto log(const std::string& message) -> void;
}
