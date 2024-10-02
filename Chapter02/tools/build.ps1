# PowerShell
[CmdletBinding()]
param (
  [Alias("h")]
  [switch] $Help = $false,

  [Alias("v")]
  [switch] $Version = $false,

  [Alias("g")]
  [switch] $Generate = $false,

  [Alias("b")]
  [switch] $Build = $false,

  [Alias("c")]
  [switch] $Customize = $false
)

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Script Setup >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

# Set the start time
$script:START_TIME = Get-Date

# Script constants
$script:SCRIPT_DIR = $PSScriptRoot
$script:SCRIPT_NAME = $MyInvocation.MyCommand.Name
$script:SCRIPT_VERSION = "1.0.0"

# Project constants
$script:PROJECT_DIR = Split-Path -Parent $script:SCRIPT_DIR
$script:PROJECT_NAME = (Get-Item $script:PROJECT_DIR).Name

# Execution constants
$script:WILL_GENERATE = $true
$script:WILL_BUILD = $true
$script:WILL_CUSTOMIZE = $false

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Script Functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

function script:Arguments
{
  # Handle -Help
  if ($Help)
  {
    script:Print 0 "SUBTITLE" "HELP"
    script:Print 0 "DEFAULT" "Displays the help information for the script."
    script:Print 0 "INFORMATION" "Usage:"
    script:Print 1 "DIMMED" "build.ps1 [options]"
    script:Print 0 "INFORMATION" "Arguments:"
    script:Print 1 "DIMMED" "-h, -Help      = Displays the help information."
    script:Print 1 "DIMMED" "-v, -Version   = Displays the script version."
    script:Print 1 "DIMMED" "-g, -Generate  = Generates the build system only."
    script:Print 1 "DIMMED" "-b, -Build     = Builds the project only."
    script:Print 1 "DIMMED" "-c, -Customize = Enables custom configurations."
    exit 0
  }

  # Handle -Version
  if ($Version)
  {
    Write-Host "v$script:SCRIPT_VERSION"
    exit 0
  }

  # Handle -Generate
  if ($Generate)
  {
    $script:WILL_BUILD = $false
  }

  # Handle -Build
  if ($Build)
  {
    $script:WILL_GENERATE = $false
  }

  # Handle -Customize
  if ($Customize)
  {
    $script:WILL_CUSTOMIZE = $true
  }
}

function script:Print
{
  param ([Int32] $local:TABS, [String] $local:TYPE, [String] $local:MESSAGE)

  # Print tabs
  if ($local:TABS -gt 0)
  {
    0..($local:TABS - 1) | ForEach-Object { Write-Host -NoNewline "    " }
  }

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
    "TITLE"
    {
      $local:TEXT = "| " + ($local:MESSAGE.ToUpper()) + " |"
      $local:DIVIDER = "*" + ("-" * ($local:TEXT.Length - 2)) + "*"
      Write-Host ""
      Write-Host -ForegroundColor White $local:DIVIDER
      Write-Host -ForegroundColor White $local:TEXT
      Write-Host -ForegroundColor White $local:DIVIDER
    }
    "SUBTITLE"
    {
      $local:TEXT = $local:MESSAGE.ToUpper()
      $local:DIVIDER = "-" * ($local:TEXT.Length)
      Write-Host ""
      Write-Host -ForegroundColor White $local:TEXT
      Write-Host -ForegroundColor White $local:DIVIDER
    }
    "CHEVRON"
    {
      Write-Host -NoNewline -ForegroundColor DarkMagenta "[>] "
    }
    "PROMPT"
    {
      Write-Host -NoNewline -ForegroundColor DarkYellow "[<] "
      Write-Host -ForegroundColor Yellow $local:MESSAGE
    }
    "SYSTEM"
    {
      Write-Host -NoNewline -ForegroundColor DarkMagenta "[>] "
      Write-Host -ForegroundColor Magenta $local:MESSAGE
    }
    "FAILURE"
    {
      Write-Host -ForegroundColor DarkRed "[X] $local:MESSAGE"
    }
    "WARNING"
    {
      Write-Host -ForegroundColor DarkYellow "[!] $local:MESSAGE"
    }
    "INFORMATION"
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

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Script Sections >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

function script:Main
{
  script:Print 0 "TITLE" "BUILD SCRIPT"
  script:Print 0 "DEFAULT" "Manages the build process of the $script:PROJECT_NAME project."

  script:Print 0 "INFORMATION" "Script details:"
  script:Print 1 "DIMMED" "Script name       = $script:SCRIPT_NAME"
  script:Print 1 "DIMMED" "Script version    = $script:SCRIPT_VERSION"

  script:Print 0 "INFORMATION" "Shell details:"
  script:Print 1 "DIMMED" ("Shell name       = PowerShell " + ($PSVersionTable.PSEdition))
  script:Print 1 "DIMMED" ("Shell version    = " + ($PSVersionTable.PSVersion))

  script:Print 0 "INFORMATION" "Platform details:"
  script:Print 1 "DIMMED" ("Operating system = " + (Get-CimInstance -ClassName Win32_OperatingSystem).Caption)
  script:Print 1 "DIMMED" ("Architecture     = " + (Get-CimInstance -ClassName Win32_OperatingSystem).OSArchitecture)

  script:Print 0 "INFORMATION" "For more information, use the '-Help' option."
}

function script:Verify
{
  script:Print 0 "SUBTITLE" "VERIFY"
  script:Print 0 "DEFAULT" "Verifies the installation of necessary tools."

  # Flags
  $local:SUCCESS = $true

  # Check for CMake
  script:Print 0 "LOADING" "Checking for CMake..."
  if (Get-Command cmake -ErrorAction SilentlyContinue)
  {
    script:Print 0 "INFORMATION" "CMake is installed. Details:"
    script:Print 1 "DIMMED" ("Path    = " + (Get-Command cmake).Source)
    script:Print 1 "DIMMED" ("Version = " + (cmake --version | Select-String -Pattern "cmake version").ToString().Split(" ")[2])
  }
  else
  {
    script:Print 0 "WARNING" "CMake is not installed. To install it:"
    script:Print 1 "DIMMED" "Windows > winget install --id=Kitware.CMake --exact"
    script:Print 1 "DIMMED" "macOS   > brew install cmake"
    script:Print 1 "DIMMED" "Linux   > Use your distribution's package manager."

    # Fail the check
    $local:SUCCESS = $false
  }

  # Verify flags
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

function script:Generate
{
  script:Print 0 "SUBTITLE" "GENERATE"
  script:Print 0 "DEFAULT" "Generates the build files for the project."

  # Handle cache
  script:Print 0 "LOADING" "Checking the cache..."
  if (Test-Path "$script:PROJECT_DIR\build\CMakeCache.txt")
  {
    script:Print 0 "LOADING" "Cache found, cleaning up..."
    Remove-Item -Path "$script:PROJECT_DIR\build\*" -Recurse -Force
    script:Print 0 "INFORMATION" "Cache cleaned up."
  }
  else
  {
    script:Print 0 "INFORMATION" "No cache found."
  }

  # Handle custom configurations
  $local:EXTRA_ARGS = ""
  if ($script:WILL_CUSTOMIZE -eq $true)
  {
    script:Print 0 "PROMPT" "Enter extra arguments for CMake:"
    script:Print 0 "CHEVRON"
    $local:EXTRA_ARGS = Read-Host
    script:Print 0 "INFORMATION" "Extra arguments set."
  }

  # Generate the build system
  script:Print 0 "LOADING" "Generating the build system..."
  if ($local:EXTRA_ARGS -ne "")
  {
    script:Print 0 "SYSTEM" "cmake -S $script:PROJECT_DIR -B $script:PROJECT_DIR\build $local:EXTRA_ARGS"
    Invoke-Expression "cmake -S $script:PROJECT_DIR -B $script:PROJECT_DIR\build $local:EXTRA_ARGS"
  }
  else
  {
    script:Print 0 "SYSTEM" "cmake -S $script:PROJECT_DIR -B $script:PROJECT_DIR\build"
    cmake -S $script:PROJECT_DIR -B $script:PROJECT_DIR\build
  }

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

function script:Build
{
  script:Print 0 "TITLE" "BUILD"
  script:Print 0 "DEFAULT" "Builds the project using the generated build system."

  # Handle custom configurations
  $local:EXTRA_ARGS = ""
  if ($script:WILL_CUSTOMIZE -eq $true)
  {
    script:Print 0 "PROMPT" "Enter extra arguments for CMake:"
    script:Print 0 "CHEVRON"
    $local:EXTRA_ARGS = Read-Host
    script:Print 0 "INFORMATION" "Extra arguments set."
  }

  # Build the project
  script:Print 0 "LOADING" "Building the project..."
  if ($local:EXTRA_ARGS -ne "")
  {
    script:Print 0 "SYSTEM" "cmake --build $script:PROJECT_DIR\build $local:EXTRA_ARGS"
    Invoke-Expression "cmake --build $script:PROJECT_DIR\build $local:EXTRA_ARGS"
  }
  else
  {
    script:Print 0 "SYSTEM" "cmake --build $script:PROJECT_DIR\build"
    cmake --build $script:PROJECT_DIR\build
  }

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

function script:Summary
{
  script:Print 0 "TITLE" "SCRIPT SUMMARY"
  script:Print 0 "DEFAULT" "Displays the summary of the script's execution."

  # Calculate the script execution time
  $local:END_TIME = Get-Date
  $local:EXECUTION_TIME = (New-TimeSpan -Start $script:START_TIME -End ($local:END_TIME))
  $local:EXECUTION_TIME_STR = $local:EXECUTION_TIME.TotalSeconds.ToString("F2")

  # Print the summary
  script:Print 0 "INFORMATION" "Execution summary:"
  script:Print 1 "DIMMED" ("Start time     = " + ($script:START_TIME.ToString("HH:mm:ss")))
  script:Print 1 "DIMMED" ("End time       = " + ($local:END_TIME.ToString("HH:mm:ss")))
  script:Print 1 "DIMMED" "Execution time = $local:EXECUTION_TIME_STR seconds"
}

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Script Execution >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

# Execute arguments
script:Arguments

# Check if on Windows
if ($IsWindows -eq $false)
{
  script:Print 0 "FAILURE" "This script is only supported on Windows."
  exit 1
}

# Execute sections
script:Main
script:Verify
if ($script:WILL_GENERATE -eq $true) { script:Generate }
if ($script:WILL_BUILD -eq $true) { script:Build }
script:Summary

# Exit the script
script:Print 0 "SUCCESS" "Script execution completed."
exit 0
