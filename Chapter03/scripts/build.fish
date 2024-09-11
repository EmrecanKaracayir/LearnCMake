#!/usr/bin/env fish

# Get the directory of the script
set SCRIPT_PATH (realpath (status dirname))
set PROJECT_PATH (dirname $SCRIPT_PATH)
set PROJECT_NAME (basename $PROJECT_PATH)

# Function to print the text in color
function print
    # Print tabs
    if test $argv[1] -gt 0
        for i in (seq 0 (math $argv[1] - 1))
            echo -n "    "
        end
    end

    # Check the type of message
    switch $argv[2]
        case DEFAULT
            set_color normal
            echo "[=] $argv[3]"
        case DIMMED
            set_color brblack
            echo "[-] $argv[3]"
        case TITLE
            echo ""
            set_color --bold brwhite
            echo "$argv[3]"
            echo "$(string repeat --count $(string length $argv[3]) -)"
        case EMPTY
            echo ""
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

# Function to print the read prompt
function prompt
    # Print prompt
    set_color brgreen
    echo -n "[>] "
    set_color normal
end

# Function to print the system prompt
function print_system_prompt
    # Print prompt
    set_color magenta
    echo "[>] $argv[1]"
    set_color normal
end

# Welcome section
begin
    # Print section information
    print 0 TITLE "BUILD SCRIPT"
    print 0 DEFAULT "Manages the build process of $PROJECT_NAME."

    # Print platform information
    print 0 MESSAGE "Platform details:"
    print 1 DIMMED "System Name      = $(uname -n)"
    print 1 DIMMED "Operating System = $(uname -s)"
    print 1 DIMMED "Kernel Version   = $(uname -r)"
    print 1 DIMMED "Processor Family = $(uname -p)"
    print 1 DIMMED "Architecture     = $(uname -m)"
end

# Verify Section
begin
    # Create a success flag
    set --local SUCCESS 1

    # Print section information
    print 0 TITLE VERIFY
    print 0 DEFAULT "Verifies the installation of necessary tools."

    # Check for CMake
    print 0 LOADING "Checking for CMake..."
    if type --query cmake
        print 0 MESSAGE "CMake is installed. Details:"

        # Print CMake installation details
        print 1 DIMMED "Path    = $(which cmake)"
        print 1 DIMMED "Version = $(cmake --version | head -n 1 | cut -d ' ' -f 3)"
    else
        print 0 WARNING "CMake is not installed. To install it:"

        # Provide installation instructions for CMake
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

        # Print Ninja installation details
        print 1 DIMMED "Path    = $(which ninja)"
        print 1 DIMMED "Version = $(ninja --version | head -n 1 | cut -d ' ' -f 1)"
    else
        print 0 WARNING "Ninja is not installed. To install it:"

        # Provide installation instructions for Ninja
        print 1 DIMMED "Windows > winget install --id=Ninja-build.Ninja --exact"
        print 1 DIMMED "macOS   > brew install ninja"
        print 1 DIMMED "Linux   > Use your distribution's package manager."

        # Fail the check
        set SUCCESS 0
    end

    # Check for failure
    if test $SUCCESS -eq 0
        print 0 FAILURE "Necessary tools are missing. Install them and try again."
        exit 1
    else
        print 0 SUCCESS "All the necessary tools are installed."
    end
end

# Generate section
begin
    # Print section information
    print 0 TITLE GENERATE
    print 0 DEFAULT "Generates the build system."

    # Get generator and compiler information
    set --local GENERATOR_ID Ninja
    set --local COMPILER_ID (cmake --system-information | grep "CMAKE_CXX_COMPILER_ID " \
        | awk -F'"' '{print $2}')

    # Print configuration details
    print 0 MESSAGE "CMake configuration details:"
    print 1 DIMMED "Source Path = $PROJECT_NAME/source"
    print 1 DIMMED "Build Path  = $PROJECT_NAME/build"
    print 1 DIMMED "Generator   = $GENERATOR_ID"
    print 1 DIMMED "Compiler    = $COMPILER_ID"

    # Check the cache
    print 0 LOADING "Checking the cache..."
    if test -d $SCRIPT_PATH/../build
        # Check if the CMakeCache.txt file exists
        if test -e $SCRIPT_PATH/../build/CMakeCache.txt
            print 0 WARNING "Cache found. Would you like to discard it? [y/N]"

            # Read the user input
            read --local --prompt prompt DISCARD

            # Check if the user wants to rebuild
            if test $DISCARD = y -o $DISCARD = Y
                # Remove everything in the build directory
                rm -rf $SCRIPT_PATH/../build*

                # Inform the user that cache clean up is done
                print 0 MESSAGE "Cache cleaned up."
            else
                # Inform the user that the cache is used
                print 0 SUCCESS "Skipped build system generation."
                return
            end
        end
    else
        # Create the build directory
        print 0 LOADING "Creating the build directory..."
        mkdir -p $SCRIPT_PATH/../build

        # Inform the user that the build directory is created
        print 0 MESSAGE "Build directory created."
    end

    # Generate the build system
    print 0 LOADING "Generating the build system..."

    print_system_prompt "cmake -S \$PROJECT_PATH -B \$PROJECT_PATH/build -G Ninja"
    cmake -S $PROJECT_PATH -B $PROJECT_PATH/build -G Ninja

    # Check if the configuration was successful
    if test $status -eq 0
        print 0 SUCCESS "Build system generated."
    else
        print 0 FAILURE "Build system generation failed. Check the logs to learn more."
        exit 1
    end
end

# Build section
begin
    # Print section information
    print 0 TITLE BUILD
    print 0 DEFAULT "Builds the $PROJECT_NAME."

    # Build the project
    print 0 LOADING "Building the project..."

    print_system_prompt "cmake --build \$PROJECT_PATH/build"
    cmake --build $PROJECT_PATH/build

    # Check if the build was successful
    if test $status -eq 0
        print 0 SUCCESS "Build successful."
    else
        print 0 FAILURE "Build failed. Check the logs to learn more."
        exit 1
    end
end
