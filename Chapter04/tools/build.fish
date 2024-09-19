#!/usr/bin/env fish

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Script Setup >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

# Set the start time
set START_TIME (date +%s)

# Script constants
set SCRIPT_DIR (dirname (realpath (status --current-filename)))
set SCRIPT_NAME (basename (realpath (status --current-filename)))
set SCRIPT_VERSION 1.0.0

# Project constants
set PROJECT_DIR (dirname $SCRIPT_DIR)
set PROJECT_NAME (basename $PROJECT_DIR)

# Execution constants
set GENERATE 1
set BUILD 1
set CUSTOMIZE 0

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Script Functions >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

function arguments
    set --local options h/help v/version g/only-generate b/only-build c/customize

    # Parse the script arguments
    if not argparse --name $SCRIPT_NAME $options -- $argv
        print 0 FAILURE "Invalid option(s) provided."
        exit 1
    end

    # Handle --help
    if set --query _flag_help
        print 0 SUBTITLE HELP
        print 0 DEFAULT "Displays the help information for the script."
        print 0 INFORMATION "Usage:"
        print 1 DIMMED "$SCRIPT_NAME [options]"
        print 0 INFORMATION "Options:"
        print 1 DIMMED "-h, --help      = Displays the help information."
        print 1 DIMMED "-v, --version   = Displays the script version."
        print 1 DIMMED "-g, --generate  = Generates the build system only."
        print 1 DIMMED "-b, --build     = Builds the project only."
        print 1 DIMMED "-c, --customize = Enables custom configurations."
        exit 0
    end

    # Handle --version
    if set --query _flag_version
        echo "v$SCRIPT_VERSION"
        exit 0
    end

    # Handle --generate
    if set --query _flag_only_generate
        set BUILD 0
    end

    # Handle --build
    if set --query _flag_only_build
        set GENERATE 0
    end

    # Handle --customize
    if set --query _flag_customize
        set CUSTOMIZE 1
    end
end

function print
    # Print tabs
    if test $argv[1] -gt 0
        for i in (seq 0 (math $argv[1] - 1))
            echo -n "    "
        end
    end

    switch $argv[2]
        case DEFAULT
            set_color normal
            echo "[=] $argv[3]"
        case DIMMED
            set_color brblack
            echo "[-] $argv[3]"
        case EMPTY
            echo ""
        case TITLE
            set --local TEXT "| $(string upper $argv[3]) |"
            set --local DIVIDER "*$(string repeat --count (math (string length $TEXT) - 2) -)*"
            echo ""
            set_color --bold brwhite
            echo $DIVIDER
            echo $TEXT
            echo $DIVIDER
        case SUBTITLE
            set --local TEXT (string upper $argv[3])
            set --local DIVIDER (string repeat --count (string length $TEXT) -)
            echo ""
            set_color --bold brwhite
            echo $TEXT
            echo $DIVIDER
        case CHEVRON
            set_color magenta
            echo -n "[>] "
        case PROMPT
            set_color yellow
            echo -n "[<] "
            set_color bryellow
            echo $argv[3]
        case SYSTEM
            set_color magenta
            echo -n "[>] "
            set_color brmagenta
            echo $argv[3]
            set_color normal
        case FAILURE
            set_color red
            echo "[X] $argv[3]"
        case WARNING
            set_color yellow
            echo "[!] $argv[3]"
        case INFORMATION
            set_color blue
            echo "[i] $argv[3]"
        case LOADING
            set_color cyan
            echo "[~] $argv[3]"
        case SUCCESS
            set_color green
            echo "[+] $argv[3]"
    end

    # Reset the color
    set_color normal
end

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Script Sections >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

function main
    print 0 TITLE "BUILD SCRIPT"
    print 0 DEFAULT "Manages the build process of the $PROJECT_NAME project."

    print 0 INFORMATION "Script details:"
    print 1 DIMMED "Script name      = $SCRIPT_NAME"
    print 1 DIMMED "Script version   = $SCRIPT_VERSION"

    print 0 INFORMATION "Shell details:"
    print 1 DIMMED "Shell name       = Fish"
    print 1 DIMMED "Shell version    = $FISH_VERSION"

    print 0 INFORMATION "Platform details:"
    print 1 DIMMED "Operating system = $(uname -s)"
    print 1 DIMMED "Architecture     = $(uname -m)"
end

function verify
    print 0 SUBTITLE VERIFY
    print 0 DEFAULT "Verifies the installation of necessary tools."

    # Flags
    set --local SUCCESS 1

    # Check for CMake
    print 0 LOADING "Checking for CMake..."
    if type --query cmake
        print 0 INFORMATION "CMake is installed. Details:"
        print 1 DIMMED "Path    = $(which cmake)"
        print 1 DIMMED "Version = $(cmake --version | head -n 1 | cut -d ' ' -f 3)"
    else
        print 0 WARNING "CMake is not installed. To install it:"
        print 1 DIMMED "Windows > winget install --id=Kitware.CMake --exact"
        print 1 DIMMED "macOS   > brew install cmake"
        print 1 DIMMED "Linux   > Use your distribution's package manager."

        # Fail the check
        set SUCCESS 0
    end

    # Verify flags
    if test $SUCCESS -eq 1
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
    print 0 LOADING "Checking the cache..."
    if test -e $PROJECT_DIR/build/CMakeCache.txt
        print 0 LOADING "Cache found, cleaning up..."
        rm -rf $PROJECT_DIR/build/*
        print 0 INFORMATION "Cache cleaned up."
    else
        print 0 INFORMATION "No cache found."
    end

    # Handle build directory
    if test -d $PROJECT_DIR/build
        print 0 LOADING "Creating the build directory..."
        mkdir -p $PROJECT_DIR/build
        print 0 INFORMATION "Build directory created."
    end

    # Handle custom configurations
    set --local EXTRA_ARGS ""
    if test $CUSTOMIZE -eq 1
        print 0 PROMPT "Enter extra arguments for CMake:"
        if read --prompt-str (print 0 CHEVRON) EXTRA_ARGS
            print 0 INFORMATION "Extra arguments set."
        else
            print 0 FAILURE "Script execution aborted."
            exit 1
        end
    end

    # Generate the build system
    print 0 LOADING "Generating the build system..."
    if not test -z $EXTRA_ARGS
        print 0 SYSTEM "cmake -S $PROJECT_DIR -B $PROJECT_DIR/build $EXTRA_ARGS"
        eval (cmake -S $PROJECT_DIR -B $PROJECT_DIR/build $EXTRA_ARGS)
    else
        print 0 SYSTEM "cmake -S $PROJECT_DIR -B $PROJECT_DIR/build"
        cmake -S $PROJECT_DIR -B $PROJECT_DIR/build
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
    set --local EXTRA_ARGS ""
    if test $CUSTOMIZE -eq 1
        # Prompt the user for extra arguments
        print 0 PROMPT "Enter extra arguments to be passed to CMake."

        # Read extra arguments
        if read --prompt-str (print 0 CHEVRON) EXTRA_ARGS
            print 0 INFORMATION "Extra arguments set."
        else
            print 0 FAILURE "Script execution aborted."
            exit 1
        end
    end

    # Build the project
    print 0 LOADING "Building the project..."
    if not test -z $EXTRA_ARGS
        print 0 SYSTEM "cmake --build $PROJECT_DIR/build $EXTRA_ARGS"
        eval (cmake --build $PROJECT_DIR/build $EXTRA_ARGS)
    else
        print 0 SYSTEM "cmake --build $PROJECT_DIR/build"
        cmake --build $PROJECT_DIR/build
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
    set --local END_TIME (date +%s)
    set --local ELAPSED_TIME (printf "%.2f" (math $END_TIME - $START_TIME))

    # Print the summary
    print 0 INFORMATION "Execution summary:"
    print 1 DIMMED "Start time   = $(date -r $START_TIME +%H:%M:%S)"
    print 1 DIMMED "End time     = $(date -r $END_TIME +%H:%M:%S)"
    print 1 DIMMED "Elapsed time = $ELAPSED_TIME seconds."
end

# <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Script Execution >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #

# Execute arguments
arguments $argv

# Execute sections
main
verify
if test $GENERATE -eq 1
    generate
end
if test $BUILD -eq 1
    build
end
summary

# Exit the script
print 0 SUCCESS "Script execution completed."
print 0 EMPTY
exit 0
