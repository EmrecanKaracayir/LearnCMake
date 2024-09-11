# PowerShell

# Script constants
$script:START_TIME = Get-Date
#
$script:SCRIPT_DIR = $PSScriptRoot
$script:SCRIPT_NAME = $MyInvocation.MyCommand.Name
$script:SCRIPT_VERSION = "1.0.0"
#
$script:PROJECT_DIR = Split-Path -Parent $script:SCRIPT_DIR
$script:PROJECT_NAME = (Get-Item $script:PROJECT_DIR).Name

# Function to print predefined messages
function script:Print
{
  param ([Int32] $local:TABS, [String] $local:TYPE, [String] $local:MESSAGE)

  # Print tabs
  if ($local:TABS -gt 0)
  {
    0..($local:TABS - 1) | ForEach-Object { Write-Host -NoNewline "    " }
  }

  # Print message
  switch ($local:TYPE)
  {
    "DEFAULT"
    {
      Write-Host "[=] $local:MESSAGE"
    }
    "DIMMED"
    {
      Write-Host -ForegroundColor DarkGray "[-] $local:MESSAGE"
    }
    "EMPTY"
    {
      Write-Host ""
    }
    "TITLE"
    {
      Write-Host ""
      Write-Host -ForegroundColor White "$local:MESSAGE"
      Write-Host -ForegroundColor White ("-" * ($local:MESSAGE.Length))
    }
    "FAILURE"
    {
      Write-Host -ForegroundColor DarkRed "[X] $local:MESSAGE"
    }
    "WARNING"
    {
      Write-Host -ForegroundColor DarkYellow "[!] $local:MESSAGE"
    }
    "MESSAGE"
    {
      Write-Host -ForegroundColor DarkBlue "[i] $local:MESSAGE"
    }
    "LOADING"
    {
      Write-Host -ForegroundColor DarkCyan "[~] $local:MESSAGE"
    }
    "SUCCESS"
    {
      Write-Host -ForegroundColor DarkGreen "[+] $local:MESSAGE"
    }
  }
}

# Function to print system prompts
function script:PrintSystemPrompt
{
  param ([String] $local:MESSAGE)

  # Print prompt
  Write-Host -ForegroundColor DarkMagenta -NoNewline "[>] "
  Write-Host -ForegroundColor Magenta $local:MESSAGE
}

# Function to print the user prompt
function script:PrintUserPrompt
{
  # Print prompt
  Write-Host -ForegroundColor DarkMagenta -NoNewline "[>] "
}

# Script section
function script:Main
{
  # Print section information
  script:Print 0 "TITLE" "SCRIPT"
  script:Print 0 "DEFAULT" "Manages the build process of the project."

  # Print project information
  script:Print 0 "MESSAGE" "Project details:"
  script:Print 1 "DIMMED" "Project name      = $script:PROJECT_NAME"
  script:Print 1 "DIMMED" "Project directory = $script:PROJECT_DIR"

  # Print script information
  script:Print 0 "MESSAGE" "Script details:"
  script:Print 1 "DIMMED" "Script name       = $script:SCRIPT_NAME"
  script:Print 1 "DIMMED" "Script directory  = $script:SCRIPT_DIR"
  script:Print 1 "DIMMED" "Script version    = $script:SCRIPT_VERSION"

  # Print shell information
  script:Print 0 "MESSAGE" "Shell details:"
  script:Print 1 "DIMMED" ("Shell name        = PowerShell " + ($PSVersionTable.PSEdition))
  script:Print 1 "DIMMED" "Shell directory   = $PSHome"
  script:Print 1 "DIMMED" ("Shell version     = " + ($PSVersionTable.PSVersion))


  # Check if on Windows
  if ($IsWindows -eq $false)
  {
    script:Print 0 "FAILURE" "This script is only supported on Windows."
    exit 1
  }

  # Print platform information
  script:Print 0 "MESSAGE" "Platform details:"
  script:Print 1 "DIMMED" "System name      = $env:COMPUTERNAME"
  script:Print 1 "DIMMED" ("Operating system = " + (Get-CimInstance -ClassName Win32_OperatingSystem).Caption)
  script:Print 1 "DIMMED" ("Kernel version   = " + (Get-CimInstance -ClassName Win32_OperatingSystem).Version)
  script:Print 1 "DIMMED" ("Processor family = " + (Get-CimInstance -ClassName Win32_Processor).Name)
  script:Print 1 "DIMMED" ("Architecture     = " + (Get-CimInstance -ClassName Win32_OperatingSystem).OSArchitecture)
}

# Verify section
function script:Verify
{
  # Create a success flag
  $local:SUCCESS = $true

  # Print section information
  script:Print 0 "TITLE" "VERIFY"
  script:Print 0 "DEFAULT" "Verifies the installation of necessary tools."

  # Check for CMake
  script:Print 0 "LOADING" "Checking for CMake..."
  if (Get-Command cmake -ErrorAction SilentlyContinue)
  {
    script:Print 0 "MESSAGE" "CMake is installed. Details:"

    # Print CMake details
    script:Print 1 "DIMMED" ("Path    = " + (Get-Command cmake).Source)
    script:Print 1 "DIMMED" ("Version = " + (cmake --version | Select-String -Pattern "cmake version").ToString().Split(" ")[2])
  }
  else
  {
    script:Print 0 "WARNING" "CMake is not installed. To install it:"

    # Provide instructions for installing CMake
    script:Print 1 "DIMMED" "Windows > winget install --id=Kitware.CMake --exact"
    script:Print 1 "DIMMED" "macOS   > brew install cmake"
    script:Print 1 "DIMMED" "Linux   > Use your distribution's package manager."

    # Fail the check
    $local:SUCCESS = $false
  }

  # Check for Ninja
  script:Print 0 "LOADING" "Checking for Ninja..."
  if (Get-Command ninja -ErrorAction SilentlyContinue)
  {
    script:Print 0 "MESSAGE" "Ninja is installed. Details:"

    # Print Ninja details
    script:Print 1 "DIMMED" ("Path    = " + (Get-Command ninja).Source)
    script:Print 1 "DIMMED" ("Version = " + (ninja --version))
  }
  else
  {
    script:Print 0 "WARNING" "Ninja is not installed. To install it:"

    # Provide instructions for installing Ninja
    script:Print 1 "DIMMED" "Windows > winget install --id=Ninja-build.Ninja --exact"
    script:Print 1 "DIMMED" "macOS   > brew install ninja"
    script:Print 1 "DIMMED" "Linux   > Use your distribution's package manager."

    # Fail the check
    $local:SUCCESS = $false
  }

  # Verify the success flag
  if ($local:SUCCESS -eq $true)
  {
    script:Print 0 "SUCCESS" "All the necessary tools are installed."
  }
  else
  {
    script:Print 0 "FAILURE" "Necessary tools are missing. Install them and try again."
    exit 1
  }
}

# Generate section
function script:Generate
{
  # Print section information
  script:Print 0 "TITLE" "GENERATE"
  script:Print 0 "DEFAULT" "Generates the build files for the project."

  # Get generator and compiler names
  $local:GENERATOR_NAME = "Ninja"
  $local:COMPILER_NAME = (cmake --system-information | Select-String -Pattern "CMAKE_CXX_COMPILER_ID ").Line.Split(" ")[1].Replace('"', '')

  # Print configuration details
  script:Print 0 "MESSAGE" "Configuration details:"
  script:Print 1 "DIMMED" "Source Path = $script:PROJECT_NAME\source"
  script:Print 1 "DIMMED" "Build Path  = $script:PROJECT_NAME\build"
  script:Print 1 "DIMMED" "Generator   = $local:GENERATOR_NAME"
  script:Print 1 "DIMMED" "Compiler    = $local:COMPILER_NAME"

  # Check the cache
  script:Print 0 "LOADING" "Checking the cache..."
  if (Test-Path "$script:PROJECT_DIR\build\CMakeCache.txt")
  {
    script:Print 0 "WARNING" "Cache found. Would you like to discard it? [Y/N]"

    # Prompt the user to discard the cache
    script:PrintUserPrompt
    $local:DISCARD_CACHE = Read-Host

    # Discard the cache if requested
    if ($local:DISCARD_CACHE -eq "Y" -or $local:DISCARD_CACHE -eq "y")
    {
      # Remove everything in the build directory
      script:Print 0 "LOADING" "Cleaning up the cache..."
      Remove-Item -Path "$script:PROJECT_DIR\build\*" -Recurse -Force

      # Inform the user that cache cle
      script:Print 0 "MESSAGE" "Cache cleaned up."
    }
    else
    {
      # Inform the user that the cache is used
      script:Print 0 "SUCCESS" "Skipped build system generation."
      return
    }
  }
  else
  {
    script:Print 0 "MESSAGE" "No cache found."
  }

  # Create the build directory if it does not exist
  if (-not (Test-Path "$script:PROJECT_DIR\build"))
  {
    script:Print 0 "LOADING" "Creating the build directory..."
    New-Item -Path "$script:PROJECT_DIR\build" -ItemType Directory | Out-Null

    # Inform the user that the build directory is created
    script:Print 0 "MESSAGE" "Build directory created."
  }

  # Generate the build system
  script:Print 0 "LOADING" "Generating the build system..."
  script:PrintSystemPrompt "cmake -G $local:GENERATOR_NAME -S $script:PROJECT_DIR -B $script:PROJECT_DIR\build"
  cmake -G $local:GENERATOR_NAME -S $script:PROJECT_DIR -B $script:PROJECT_DIR\build

  # Check if the build system generation was successful
  if ($LASTEXITCODE -eq 0)
  {
    script:Print 0 "SUCCESS" "Build system generated."
  }
  else
  {
    script:Print 0 "FAILURE" "Build system generation failed. Check the logs for details."
    exit 1
  }
}

# Build section
function script:Build
{
  # Print section information
  script:Print 0 "TITLE" "BUILD"
  script:Print 0 "DEFAULT" "Builds the project using the generated build system."

  # Build the project
  script:Print 0 "LOADING" "Building the project..."
  script:PrintSystemPrompt "cmake --build $script:PROJECT_DIR\build"
  cmake --build $script:PROJECT_DIR\build

  # Check if the build was successful
  if ($LASTEXITCODE -eq 0)
  {
    script:Print 0 "SUCCESS" "Build successful."
  }
  else
  {
    script:Print 0 "FAILURE" "Build failed. Check the logs for details."
    exit 1
  }
}

# Summary section
function script:Summary
{
  # Print section information
  script:Print 0 "TITLE" "SUMMARY"
  script:Print 0 "DEFAULT" "Displays the summary of the process."

  # Calculate the script execution time
  $local:END_TIME = Get-Date
  $local:EXECUTION_TIME = (New-TimeSpan -Start $script:START_TIME -End ($local:END_TIME))

  # Convert the execution time to seconds
  $local:EXECUTION_TIME_STR = $local:EXECUTION_TIME.TotalSeconds.ToString("F2")

  # Print the summary
  script:Print 0 "MESSAGE" "Build summary:"
  script:Print 1 "DIMMED" ("Start time     = " + ($script:START_TIME.ToString("HH:mm:ss")))
  script:Print 1 "DIMMED" ("End time       = " + ($local:END_TIME.ToString("HH:mm:ss")))
  script:Print 1 "DIMMED" "Execution time = $local:EXECUTION_TIME_STR seconds"
}

# Script execution
script:Main
script:Verify
script:Generate
script:Build
script:Summary

# Print the completion message
script:Print 0 "SUCCESS" "Process completed successfully."
script:Print 0 "EMPTY"

# Exit the script
exit 0
