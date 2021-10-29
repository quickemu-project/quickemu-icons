#!/bin/bash

SVGO=$(command -v svgo)
if [ ! -e "${SVGO}" ]; then
		echo "ERROR - SVGO not found. Install with npm."
		echo "    npm install -g svgo"
		exit 1
fi

SVGEXPORT=$(command -v svgexport)
if [ ! -e "${SVGEXPORT}" ]; then
		echo "ERROR - svgexport not found. Install with npm."
		echo "    npm install -g svgexport"
		exit 1
fi

FILES=""
OUTPUT_FILES=""
OUTPUT_DIR="./build"

if [ ! -d "$OUTPUT_DIR" ]; then
		mkdir $OUTPUT_DIR
fi

if [ -d "$OUTPUT_DIR/svg" ]; then
		rm -r "$OUTPUT_DIR/svg"
fi
mkdir $OUTPUT_DIR/svg

if [ -d "$OUTPUT_DIR/png" ]; then
		rm -r "$OUTPUT_DIR/png"
fi
mkdir $OUTPUT_DIR/png

for i in *.svg; do
		FILES="$FILES./$i "
		OUTPUT_FILES="$OUTPUT_FILES./$OUTPUT_DIR/svg/$i "
		TEMP_OUTPUT="./$OUTPUT_DIR/png/$i"
		${SVGEXPORT} "./$i" ${TEMP_OUTPUT/.svg/.png} 512
done

${SVGO} $FILES -o $OUTPUT_FILES

cd build/
echo "Creating archive"
tar cvzf quickemu-icons.tar.gz *
echo "Done - quickemu-icons.tar.gz created in build/"
