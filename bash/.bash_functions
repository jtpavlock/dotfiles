#!/bin/bash
#
# define functions for bash

# count lines of code in a github repo
# requires `cloc` to be installed
function cloc-git() {
	git clone --depth 1 "$1" temp-linecount-repo &&
		printf "('temp-linecount-repo' will be deleted automatically)\n\n\n" &&
		cloc temp-linecount-repo &&
		rm -rf temp-linecount-repo
}
