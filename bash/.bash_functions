#!/bin/bash
#
# define functions for bash

# run mpv quietly in background
mpv-q ()
{
	mpv --really-quiet "$1" &	
	disown  		# allow for closing current terminal
}

# run mpv quietly in backgound and exit current terminal
mpv-qe ()
{
	mpv --really-quiet "$1" &	
	disown		  		# allow for closing current terminal
	exit				# close current terminal
}

