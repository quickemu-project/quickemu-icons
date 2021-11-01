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

PROJECT_ROOT=$(pwd)
BUILD_DIR="$PROJECT_ROOT/build"

# Start from a clean slate
rm -rf "$BUILD_DIR"

for distro_icon in src/distro-icons/*.svg; do
	# Create directories for every distro (e.g. 'build/png/fedora' and 'build/svg/fedora')
	DISTRO_NAME=$(basename -a -s .svg "$distro_icon")
	PNG_DIR="$BUILD_DIR/png/$DISTRO_NAME"
	SVG_DIR="$BUILD_DIR/svg/$DISTRO_NAME"
	mkdir -p "$PNG_DIR"
	mkdir -p "$SVG_DIR"

	for quickemu_icon in src/quickemu-icons/*.svg; do
		# Combine the distro icon with every quickemu icon variant that has a background
		# and save the output under 'build/svg/fedora/DISTRO-QEMU_VARIANT.svg'
		if [[ ! "$(basename "$quickemu_icon")" =~ "nobg" ]]; then
			SVG_OUTPUT_FILENAME="$DISTRO_NAME"-"$(basename "$quickemu_icon" | cut -d "-" -f2-)"
			SVG_OUTPUT_PATH="$SVG_DIR/$SVG_OUTPUT_FILENAME"
			./combine.sh "$distro_icon" "$quickemu_icon" "$SVG_OUTPUT_PATH"
			${SVGO} "$SVG_OUTPUT_PATH"

			# Create PNG out of the combined image
			PNG_OUTPUT_FILENAME="$DISTRO_NAME-$(basename "$quickemu_icon" | cut -d "-" -f2- | cut -d "." -f1).png"
			PNG_OUTPUT_PATH="$PNG_DIR/$PNG_OUTPUT_FILENAME"
			${SVGEXPORT} "$SVG_OUTPUT_PATH" "$PNG_OUTPUT_PATH" 512
		fi
	done
done

cd "$PROJECT_ROOT/build/" || exit
echo "Creating archive"
tar cvzf quickemu-icons.tar.gz -- *
echo "Done - quickemu-icons.tar.gz created in build/"
