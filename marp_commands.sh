#!/bin/bash

##########################################################################
# Creates several bash commands to run the marp slide generator
#
# - marp-pdf [MD_FILE] - converts markdown to a pdf slide file
# - marp-html [MD_FILE] - converts markdown to an html file
# - marp-auto [MD_FILE] - converts markdown to pdf, reruns if md file changes
#
# Assumes Environment Variable $MD_SLIDES_DIR is set to this directory
##########################################################################

# Generates pdf slides
function marp-pdf {
	marp --theme-set "$MD_SLIDES_DIR/themes/ucbc.css" --html true --allow-local-files --pdf "$1"
}

# Generates html slides
function marp-html {
	marp --theme-set "$MD_SLIDES_DIR/themes/ucbc.css" --html true --allow-local-files --html "$1"
}

# Will monitor the file and regenerate it when it changes (using entr)
function marp-auto {
	marp_cmd="marp --theme-set ${MD_SLIDES_DIR}/themes/ucbc.css --html true --allow-local-files --pdf ${1}"
	echo "$1" | entr -s "$marp_cmd"
}

# Completes with all markdown files in the current directory
function _md-files-completion() {
	local cur=${COMP_WORDS[COMP_CWORD]}
	COMPREPLY=( $(compgen -W "$(find * -maxdepth 1 -name '*.md')" -- $cur) )
}

complete -F _md-files-completion marp-pdf
complete -F _md-files-completion marp-html
complete -F _md-files-completion marp-auto


