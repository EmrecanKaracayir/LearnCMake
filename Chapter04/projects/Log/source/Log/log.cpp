#include "Log/log.hpp"

#include <IO/output.hpp>

#include <chrono>
#include <format>

namespace Log
{
  auto log(const std::string &message) -> void
  {
    // Get the current time
    const auto now{std::chrono::floor<std::chrono::seconds>(std::chrono::system_clock::now())};

    // Get the current time in the local time zone
    const std::chrono::zoned_time time{std::chrono::current_zone(), now};

    // Write the message to the standard output
    IO::writeLine(std::format("[{:%T}]", time) + " | " + message);
  }
}
