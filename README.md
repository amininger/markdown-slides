# Markdown Slides

This contains css themes and resources for generating slides from markdown files using Marp

## Usage

See the `marp_commands.sh` for examples of how to use the provided themes. 

In general, run marp with the following command line arguments:
* `--theme-set [PATH_TO_CSS_FILE]` : specifies the theme css file
* `--html true` : allows html elements to be mixed into the markdown
* `--allow-local-files` : required to allow access to local fonts/images
* `--pdf` or `--html` : defines the type of file to produce

## Setup

You need to install the marp-cli tool from <https://github.com/marp-team/marp-cli/releases>

### General

Note: for now, the file paths to fonts/images are hard-coded in the `themes/congo.css` file. So you should change those paths in your local version to have them load correctly. 

### Linux

1. Make sure the `marp` tool is on the path
2. Set the environment variable `$MD_SLIDES_DIR` to this directory
3. Source the `marp_commands.sh` file

This will enable the following commands:
* `marp-pdf [MD_FILE]` : renders the slides into a pdf using the ucbc theme
* `marp-html [MD_FILE]` : renders the slides into an html doc using the ucbc theme
* `marp-auto [MD_FILE]` : renders to a pdf, automatically re-runs if the md file changes (requires the entr tool)

_Note: All three commands auto-complete to markdown files specifically_




