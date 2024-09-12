#!/usr/bin/env fish

# Script constants
set START_TIME (date +%s)
#
set SCRIPT_DIR (dirname (realpath (status --current-filename)))
set SCRIPT_NAME (basename (realpath (status --current-filename)))
set SCRIPT_VERSION 1.0.0
#
set PROJECT_DIR (dirname $SCRIPT_DIR)
set PROJECT_NAME (basename $PROJECT_DIR)

# Function to print predefined messages
function print
    # Print tabs
    if test $argv[1] -gt 0
        for i in (seq 0 (math $argv[1] - 1))
            echo -n "    "
        end
    end

    # Print message
    switch $argv[2]
        case DEFAULT
            set_color normal
            echo "[=] $argv[3]"
        case DIMMED
            set_color brblack
            echo "[-] $argv[3]"
        case EMPTY
            echo ""
        case HEADER
            set --local TITLE "| $(string upper $argv[3]) |"
            set --local DIVIDER "*$(string repeat --count (math (string length $TITLE) - 2) -)*"
            echo ""
            set_color --bold brgreen
            echo $DIVIDER
            echo $TITLE
            echo $DIVIDER
        case TITLE
            set --local TITLE (string upper $argv[3])
            set --local DIVIDER (string repeat --count (string length $TITLE) -)
            echo ""
            set_color --bold brwhite
            echo $TITLE
            echo $DIVIDER
        case FOOTER
            set --local TITLE "| $(string upper $argv[3]) |"
            set --local DIVIDER "*$(string repeat --count (math (string length $TITLE) - 2) -)*"
            echo ""
            set_color --bold brred
            echo $DIVIDER
            echo $TITLE
            echo $DIVIDER
        case FAILURE
            set_color red
            echo "[x] $argv[3]"
        case WARNING
            set_color yellow
            echo "[!] $argv[3]"
        case MESSAGE
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

# Function to print system prompts
function print_system_prompt
    # Print prompt
    set_color magenta
    echo -n "[>] "
    set_color brmagenta
    echo $argv[1]
    set_color normal
end

# Function to print the user prompt
function print_user_prompt
    # Print prompt
    set_color magenta
    echo -n "[>] "
    set_color normal
end

# Script section
function main
    # Print section information
    print 0 HEADER "BUILD SCRIPT"
    print 0 DEFAULT "Manages the build process of the project."

    # Print project information
    print 0 MESSAGE "Project details:"
    print 1 DIMMED "Project name      = $PROJECT_NAME"
    print 1 DIMMED "Project directory = $PROJECT_DIR"

    # Print script information
    print 0 MESSAGE "Script details:"
    print 1 DIMMED "Script name       = $SCRIPT_NAME"
    print 1 DIMMED "Script directory  = $SCRIPT_DIR"
    print 1 DIMMED "Script version    = $SCRIPT_VERSION"

    # Print shell information
    print 0 MESSAGE "Shell details:"
    print 1 DIMMED "Shell name        = Fish"
    print 1 DIMMED "Shell directory   = $(dirname $SHELL)"
    print 1 DIMMED "Shell version     = $FISH_VERSION"

    # Print platform information
    print 0 MESSAGE "Platform details:"
    print 1 DIMMED "System name       = $(uname -n)"
    print 1 DIMMED "Operating system  = $(uname -s)"
    print 1 DIMMED "Kernel version    = $(uname -r)"
    print 1 DIMMED "Processor family  = $(uname -p)"
    print 1 DIMMED "Architecture      = $(uname -m)"
end

# Verify Section
function verify
    # Create a success flag
    set --local SUCCESS 1

    # Print section information
    print 0 TITLE VERIFY
    print 0 DEFAULT "Verifies the installation of necessary tools."

    # Check for CMake
    print 0 LOADING "Checking for CMake..."
    if type --query cmake
        print 0 MESSAGE "CMake is installed. Details:"

        # Print CMake details
        print 1 DIMMED "Path    = $(which cmake)"
        print 1 DIMMED "Version = $(cmake --version | head -n 1 | cut -d ' ' -f 3)"
    else
        print 0 WARNING "CMake is not installed. To install it:"

        # Provide instructions for installing CMake
        print 1 DIMMED "Windows > winget install --id=Kitware.CMake --exact"
        print 1 DIMMED "macOS   > brew install cmake"
        print 1 DIMMED "Linux   > Use your distribution's package manager."

        # Fail the check
        set SUCCESS 0
    end

    # Check for Ninja
    print 0 LOADING "Checking for Ninja..."
    if type --query ninja
        print 0 MESSAGE "Ninja is installed. Details:"

        # Print Ninja details
        print 1 DIMMED "Path    = $(which ninja)"
        print 1 DIMMED "Version = $(ninja --version)"
    else
        print 0 WARNING "Ninja is not installed. To install it:"

        # Provide instructions for installing Ninja
        print 1 DIMMED "Windows > winget install --id=Ninja-build.Ninja --exact"
        print 1 DIMMED "macOS   > brew install ninja"
        print 1 DIMMED "Linux   > Use your distribution's package manager."

        # Fail the check
        set SUCCESS 0
    end

    # Verify the success flag
    if test $SUCCESS -eq 1
        print 0 SUCCESS "All the necessary tools are installed."
    else
        print 0 FAILURE "Necessary tools are missing. Install them and try again."
        exit 1
    end
end

# Generate section
function generate
    # Print section information
    print 0 TITLE GENERATE
    print 0 DEFAULT "Generates the build files for the project."

    # Get generator and compiler names
    set --local GENERATOR_NAME Ninja
    set --local COMPILER_NAME (cmake --system-information | grep "CMAKE_CXX_COMPILER_ID " \
        | awk -F'"' '{print $2}')

    # Print configuration details
    print 0 MESSAGE "Configuration details:"
    print 1 DIMMED "Source path = $PROJECT_NAME/source"
    print 1 DIMMED "Build path  = $PROJECT_NAME/build"
    print 1 DIMMED "Generator   = $GENERATOR_NAME"
    print 1 DIMMED "Compiler    = $COMPILER_NAME"

    # Check the cache
    print 0 LOADING "Checking the cache..."
    if test -e $PROJECT_DIR/build/CMakeCache.txt
        print 0 WARNING "Cache found. Would you like to discard it? [Y/N]"

        # Prompt the user to discard the cache
        read --local --prompt print_user_prompt DISCARD_CACHE

        # Check if the user wants to rebuild
        if test $DISCARD_CACHE = y -o $DISCARD_CACHE = Y
            # Remove everything in the build directory
            print 0 LOADING "Cleaning up the cache..."
            rm -rf $PROJECT_DIR/build*

            # Inform the user that cache clean up is done
            print 0 MESSAGE "Cache cleaned up."
        else
            # Inform the user that the cache is used
            print 0 SUCCESS "Skipped build system generation."
            return
        end
    else
        print 0 MESSAGE "No cache found."
    end

    # Create the build directory if it does not exist
    if test -d $PROJECT_DIR/build
        print 0 LOADING "Creating the build directory..."
        mkdir -p $PROJECT_DIR/build

        # Inform the user that the build directory is created
        print 0 MESSAGE "Build directory created."
    end

    # Generate the build system
    print 0 LOADING "Generating the build system..."
    print_system_prompt "cmake -G \"$GENERATOR_NAME\" -S $PROJECT_DIR -B $PROJECT_DIR/build"
    cmake -G "$GENERATOR_NAME" -S $PROJECT_DIR -B $PROJECT_DIR/build

    # Check if the build system generation was successful
    if test $status -eq 0
        print 0 SUCCESS "Build system generated."
    else
        print 0 FAILURE "Build system generation failed. Check the logs for details."
        exit 1
    end
end

# Build section
function build
    # Print section information
    print 0 TITLE BUILD
    print 0 DEFAULT "Builds the project using the generated build system."

    # Build the project
    print 0 LOADING "Building the project..."
    print_system_prompt "cmake --build $PROJECT_DIR/build"
    cmake --build $PROJECT_DIR/build

    # Check if the build was successful
    if test $status -eq 0
        print 0 SUCCESS "Build successful."
    else
        print 0 FAILURE "Build failed. Check the logs for details."
        exit 1
    end
end

# Summary section
function summary
    # Print section information
    print 0 FOOTER "SCRIPT SUMMARY"
    print 0 DEFAULT "Displays the summary of the script's execution."

    # Calculate the script execution time
    set END_TIME (date +%s)
    set ELAPSED_TIME (printf "%.2f" (math $END_TIME - $START_TIME))

    # Print the summary
    print 0 MESSAGE "Execution summary:"
    print 1 DIMMED "Start time   = $(date -r $START_TIME +%H:%M:%S)"
    print 1 DIMMED "End time     = $(date -r $END_TIME +%H:%M:%S)"
    print 1 DIMMED "Elapsed time = $ELAPSED_TIME seconds."
end

# Script execution
main
verify
generate
build
summary

# Print the completion message
print 0 SUCCESS "Script execution completed."
print 0 EMPTY

# Exit the script
exit 0
