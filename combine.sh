#!/bin/bash

# Takes two SVG files (the first two arguments) and layers them above each other.
# The third argument is the output file.
# Make sure that the canvas size is the same in all files,
# otherwise the positioning of the images is not correct!

set -e

if [[ $# -ne 3 ]]; then
    echo "ERROR! Please provide exactly 3 arguments (two input files and one output file)."
    exit 1
fi

# TODO Check canvas sizes

# Make sure all input files went through svgo for homogenous structure
for file in "$1" "$2"; do
    svgo --pretty --indent 0 --final-newline "$file"
done

# Delete contents of output file, if it exists
if [[ -e "$3" ]]; then
    rm "$3"
fi
touch "$3"

# Remove the svg tags from files and stitch them together
grep --invert-match "</svg>" "$1" >> "$3"
grep --invert-match "<svg" "$2" >> "$3"
