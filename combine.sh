#!/bin/bash

# Takes two SVG files (the first two arguments) and layers them above each other.
# The third argument is the output file.
# Make sure that the canvas size is the same in all files,
# otherwise the positioning of the images is not correct!

set -e

SVGO=$(command -v svgo)
if [ ! -e "${SVGO}" ]; then
		echo "ERROR - SVGO not found. Install with npm."
		echo "    npm install -g svgo"
		exit 1
fi

if [[ $# -ne 3 ]]; then
    echo "ERROR! Please provide exactly 3 arguments (two input files and one output file)."
    exit 1
fi

for file in "$1" "$2"; do
    # Make sure all input files went through svgo for homogenous structure
    ${SVGO} --pretty --indent 0 --final-newline "$file"
    if ! head -1 "$file" | grep -q "height=\"512\"" - || ! head -1 "$file" | grep -q "width=\"512\"" -; then
        echo "ERROR! The canvas of '$file' is not 512x512 pixels in size."
        exit 1
    fi
done

# Delete contents of output file, if it exists
if [[ -e "$3" ]]; then
    rm "$3"
fi
touch "$3"

# Remove the svg tags from files and stitch them together
grep --invert-match "</svg>" "$1" >> "$3"
grep --invert-match "<svg" "$2" >> "$3"
