#!/bin/bash
#
# define functions for bash

# run mpv quietly in background
mpv-q () {
    mpv --really-quiet "$1" &
    disown              # allow for closing current terminal
}
# run mpv quietly in backgound and exit current terminal
mpv-qe () {
    mpv --really-quiet "$1" &
    disown                              # allow for closing current terminal
    exit                                # close current terminal
}

# filebot renaming
filebot-movie () {
    filebot -rename "$1" --db TheMovieDB \
            --format "{ny}/{ny} [{vf}][{source}]" "${@:2}"
}
filebot-tv () {
    filebot -rename "$1" --db TheTVDB \
            --format "../{ny}/Season {s.pad(2)}/\
{s00e00} - {t} [{vf}][{source}]" "${@:2}"
}
# tv anime
filebot-tva () {
    filebot -rename "$1" --db AniDB \
            --format "../{ny}/Season {s.pad(2)}/\
{s00e00} - {t} [{vf}][{source}]" "${@:2}"
}
