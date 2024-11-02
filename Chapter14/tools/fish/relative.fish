#!/usr/bin/env fish

function relative
    # Get path parts
    set --local sourceParts (string match --invert '' (string split '/' $argv[1]))
    set --local targetParts (string match --invert '' (string split '/' $argv[2]))

    # Find common prefix length
    set --local i 1
    while test $i -le (count $sourceParts) -a $i -le (count $targetParts)
        if test "$sourceParts[$i]" = "$targetParts[$i]"
            set i (math $i + 1)
        else
            break
        end
    end

    # Initialize relative parts
    set --local relativeParts

    # Add .. for each remaining source part
    set --local j $i
    while test $j -le (count $sourceParts)
        set relativeParts $relativeParts ".."
        set j (math $j + 1)
    end

    # Add each remaining target part
    set j $i
    while test $j -le (count $targetParts)
        set relativeParts $relativeParts "$targetParts[$j]"
        set j (math $j + 1)
    end

    # If relative path is empty, paths are same, return .
    if test (count $relativeParts) -eq 0
        echo "."
        return 0
    end

    # Join and return the relative path
    echo (string join '/' $relativeParts)
end
