<img src="quickemu.png" alt="quickemu" width="128" /><h1 style="line-height: 64px">Quickemu - Icons</h1>

Quickemu VM icons for various operating systems for use in desktop files etc.

Visit the [Releases page](https://github.com/Lukewh/quickemu-icons/releases) to download optimized versions.

[Quickemu](https://github.com/wimpysworld/quickemu) is a project by the awesome Martin Wimpress.
Check out his [Twitch channel](https://twitch.tv/wimpysworld) for coding streams and other fun stuff!

<hr />

## VM Examples

<table>
	<thead>
		<tr>
			<th>OS</th>
			<th>PNG</th>
			<th>SVG</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th><b>macOS</b></th>
			<td><img src="examples/macos.png" alt="macOS PNG" width="128"/></td>
			<td><img src="examples/macos.svg" alt="macOS SVG" width="128"/></td>
		</tr>
		<tr>
			<th><b>Ubuntu</b></th>
			<td><img src="examples/ubuntu.png" alt="Ubuntu PNG" width="128"/></td>
			<td><img src="examples/ubuntu.svg" alt="Ubuntu SVG" width="128"/></td>
		</tr>
		<tr>
			<th><b>Windows</b></th>
			<td><img src="examples/windows.png" alt="Windows PNG" width="128"/></td>
			<td><img src="examples/windows.svg" alt="Window SVG" width="128"/></td>
		</tr>
   	</tbody>
</table>

## Quickemu logos

<table>
	<thead>
		<tr>
			<th>Colour</th>
			<th>With background</th>
			<th>Without background</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>Pink</th>
			<td><img src="src/quickemu-icons/quickemu-pink.svg" alt="Quickemu pink with background" /></td>
			<td><img src="src/quickemu-icons/quickemu-pink-nobg.svg" alt="Quickemu pink without background" /></td>
			<td></td>
		</tr>
		<tr>
			<th>Black</th>
			<td><img src="src/quickemu-icons/quickemu-black.svg" alt="Quickemu black with background" /></td>
			<td><img src="src/quickemu-icons/quickemu-black-nobg.svg" alt="Quickemu black without background" /></td>
			<td></td>
		</tr>
		<tr>
			<th>White</th>
			<td><img src="src/quickemu-icons/quickemu-white.svg" alt="Quickemu white with background" /></td>
			<td><img src="src/quickemu-icons/quickemu-white-nobg.svg" alt="Quickemu white without background" /></td>
			<td><img src="src/quickemu-icons/quickemu-white-pinkbg.svg" alt="Quickemu white with pink background" /></td>
		</tr>
		<tr>
		</tr>
	</tbody>
</table>

## How to contribute

Thanks for your help in keeping this project up to date - it is very much appreciated!

Have a look at the [Pending Distro additions](https://github.com/Lukewh/quickemu-icons/issues/12) for `quickemu`
or browse through the [Pull Requests](https://github.com/wimpysworld/quickemu/pulls) yourself.

Here are some things to consider before filing a Pull Request.

### Build dependencies

- `svgo` (`npm install -g svgo`)
- `svgexport` (`npm install -g svgexport`)

### Requirements for distro icons

Once you found something to work on, make sure that the icon meets the following requirements:

- **Size:** 512x512 pixels (potential background included)
- **Solid background:** The icon should have a big non-transparent area.
  If it (1) *consists mainly of thin lines* (like [Elementary](src/distro-icons/elementary.svg), [Linux Mint](src/distro-icons/linuxmint.svg) or [Pop!_OS](src/distro-icons/popos.svg))
  or (2) *encloses a transparent area* (like [NixOS](src/distro-icons/nixos.svg), [openSUSE](src/distro-icons/opensuse.svg)),
  consider placing the icon in a white circle, or at least fill the enclosed area with a white background.

Please test if your icon works well in by running `build.sh` and checking if all looks good at `build/(png|svg)/DISTRO`.

### Requirements for quickemu icons

Same as the above, but additionally:

- **Provide two versions:**
  - `*.svg` (Full-size icon)
  - `*-overlay.svg` (to merge with the distro icons)
    - 512x512px canvas
    - Icon is at the bottom right
    - 155x155px circle around the icon (for `nobg` variants, draw a circle to align everything and then delete it)
- **Naming scheme:** `FGCOLOR` is the foreground color, `BGCOLOR` is the background color (only used with non-white backgrounds)
  - `quickemu-FGCOLOR.svg`
  - `quickemu-FGCOLOR-overlay.svg`
  - `quickemu-FGCOLOR-nobg.svg`
  - `quickemu-FGCOLOR-nobg-overlay.svg`
  - `quickemu-FGCOLOR-BGCOLORbg.svg`
  - `quickemu-FGCOLOR-BGCOLORbg-overlay.svg`
