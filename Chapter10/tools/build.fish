#!/usr/bin/env fish

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Script Info >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

set scriptPath (realpath (status --current-filename))
set scriptDir (dirname $scriptPath)
set scriptName (basename $scriptPath)
set scriptVersion 2.0.0

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Script Imports >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

source "$scriptDir/fish/print.fish"
source "$scriptDir/fish/relative.fish"

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Script Setup >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

# Set the start time
set startTime (date +%s)

# Project constants
set projectDir (dirname "$scriptDir")
set projectName (basename "$projectDir")

# CMake constants
set sourceDir (relative "$PWD" "$projectDir")
set buildDir (relative "$PWD" "$projectDir/build")

# Execution constants
set generate 1
set build 1
set customize 0
set fresh 0

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Script Functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

function arguments
    set --local options h/help v/version g/generate b/build c/customize f/fresh

    # Parse the script arguments
    if not argparse --name "$scriptName" $options -- $argv
        print 0 FAILURE "Invalid option(s) provided."
        exit 1
    end

    # Handle --help
    if set --query _flag_help
        print 0 SUBTITLE HELP
        print 0 DEFAULT "Displays the help information for the script."
        print 0 INFORMATION "Usage:"
        print 1 DIMMED "$scriptName [options]"
        print 0 INFORMATION "Options:"
        print 1 DIMMED "-h, --help      = Displays the help information."
        print 1 DIMMED "-v, --version   = Displays the script version."
        print 1 DIMMED "-g, --generate  = Generates the build system only."
        print 1 DIMMED "-b, --build     = Builds the project only."
        print 1 DIMMED "-c, --customize = Enables custom configurations."
        print 1 DIMMED "-f, --fresh     = Cleans up the cache before generating."
        exit 0
    end

    # Handle --version
    if set --query _flag_version
        echo "v$scriptVersion"
        exit 0
    end

    # Handle --generate
    if set --query _flag_generate
        set build 0
    end

    # Handle --build
    if set --query _flag_build
        set generate 0
    end

    # Handle --customize
    if set --query _flag_customize
        set customize 1
    end

    # Handle --fresh
    if set --query _flag_fresh
        set fresh 1
    end
end

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Script Sections >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

function main
    print 0 TITLE "BUILD SCRIPT"
    print 0 DEFAULT "Manages the build process of the $projectName project."

    print 0 INFORMATION "Script details:"
    print 1 DIMMED "Script name      = $scriptName"
    print 1 DIMMED "Script version   = $scriptVersion"

    print 0 INFORMATION "Shell details:"
    print 1 DIMMED "Shell name       = Fish"
    print 1 DIMMED "Shell version    = $FISH_VERSION"

    print 0 INFORMATION "Platform details:"
    print 1 DIMMED "Operating system = $(uname -s)"
    print 1 DIMMED "Architecture     = $(uname -m)"

    print 0 INFORMATION "For more information, use the '--help' option."
end

function verify
    print 0 SUBTITLE VERIFY
    print 0 DEFAULT "Verifies the installation of necessary tools."

    # Flags
    set --local success 1

    # Check for CMake
    print 0 LOADING "Checking for CMake..."
    if type --query cmake
        print 0 INFORMATION "CMake is installed. Details:"
        print 1 DIMMED "Path    = $(which cmake)"
        print 1 DIMMED "Version = $(cmake --version | head -n 1 | cut -d ' ' -f 3)"
    else
        print 0 WARNING "CMake is not installed. To install it:"
        print 1 DIMMED "Windows > winget install --id=Kitware.CMake --exact"
        print 1 DIMMED "macOS   > brew install --cask cmake"
        print 1 DIMMED "Linux   > Use your distribution's package manager."

        # Fail the check
        set success 0
    end

    # Verify flags
    if test $success -eq 1
        print 0 SUCCESS "All the necessary tools are installed."
    else
        print 0 FAILURE "Necessary tools are missing. Install them and try again."
        exit 1
    end
end

function generate
    print 0 SUBTITLE GENERATE
    print 0 DEFAULT "Generates the build files for the project."

    # Handle cache
    if test $fresh -eq 1
        print 0 LOADING "Cleaning up the cache..."
        rm -rf "$projectDir/build"
        print 0 INFORMATION "Cache cleaned up."
    end

    # Handle custom configurations
    set --local extraArgs ""
    if test $customize -eq 1
        print 0 PROMPT "Enter extra arguments for CMake:"
        if read --prompt-str (print 0 CHEVRON) extraArgs
            print 0 INFORMATION "Extra arguments set."
        else
            print 0 FAILURE "Script execution aborted."
            exit 1
        end
    end

    # Generate the build system
    print 0 LOADING "Generating the build system..."
    if not test -z "$extraArgs"
        print 0 SYSTEM "cmake -S \"$sourceDir\" -B \"$buildDir\" $extraArgs"
        eval cmake -S "$sourceDir" -B "$buildDir" $extraArgs
    else
        print 0 SYSTEM "cmake -S \"$sourceDir\" -B \"$buildDir\""
        cmake -S "$sourceDir" -B "$buildDir"
    end

    # Check if the build system generation was successful
    if test $status -eq 0
        print 0 SUCCESS "Build system generated."
    else
        print 0 FAILURE "Build system generation failed. Check the logs for details."
        exit 1
    end
end

function build
    print 0 SUBTITLE BUILD
    print 0 DEFAULT "Builds the project using the generated build system."

    # Handle custom configurations
    set --local extraArgs ""
    if test $customize -eq 1
        # Prompt the user for extra arguments
        print 0 PROMPT "Enter extra arguments for CMake."

        # Read extra arguments
        if read --prompt-str (print 0 CHEVRON) extraArgs
            print 0 INFORMATION "Extra arguments set."
        else
            print 0 FAILURE "Script execution aborted."
            exit 1
        end
    end

    # Build the project
    print 0 LOADING "Building the project..."
    if not test -z "$extraArgs"
        print 0 SYSTEM "cmake --build \"$buildDir\" $extraArgs"
        eval cmake --build "$buildDir" $extraArgs
    else
        print 0 SYSTEM "cmake --build \"$buildDir\""
        cmake --build "$buildDir"
    end

    # Check if the build was successful
    if test $status -eq 0
        print 0 SUCCESS "Build successful."
    else
        print 0 FAILURE "Build failed. Check the logs for details."
        exit 1
    end
end

function summary
    print 0 TITLE "SCRIPT SUMMARY"
    print 0 DEFAULT "Displays the summary of the script's execution."

    # Calculate the script execution time
    set --local endTime (date +%s)
    set --local elapsedTime (printf "%.2f" (math $endTime - $startTime))

    # Print the summary
    print 0 INFORMATION "Execution summary:"
    print 1 DIMMED "Start time   = $(date -r $startTime +%H:%M:%S)"
    print 1 DIMMED "End time     = $(date -r $endTime +%H:%M:%S)"
    print 1 DIMMED "Elapsed time = $elapsedTime seconds."
end

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Script Execution >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

# Execute arguments
arguments $argv

# Execute sections
main
verify
if test $generate -eq 1
    generate
end
if test $build -eq 1
    build
end
summary

# Exit the script
print 0 SUCCESS "Script execution completed."
exit 0
