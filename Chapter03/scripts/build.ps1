# Get the directory of the script
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path

# Function to print the text in color
function Print
{
  param ([string] $Type, [string] $Message)

  switch ($Type)
  {
    "FAILURE"
    {
      Write-Host "[X]: $Message" -ForegroundColor Red
    }
    "WARNING"
    {
      Write-Host "[!]: $Message" -ForegroundColor Yellow
    }
    "MESSAGE"
    {
      Write-Host "[i]: $Message" -ForegroundColor Blue
    }
    "LOADING"
    {
      Write-Host "[~]: $Message" -ForegroundColor Cyan
    }
    "SUCCESS"
    {
      Write-Host "[+]: $Message" -ForegroundColor Green
    }
  }
}
