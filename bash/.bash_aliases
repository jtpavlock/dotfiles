#!/bin/bash
#
# define aliases for bash

## make things colorful

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'

# less
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# syntax highlighting in less
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

## change some commands

# ls
alias ll='ls -lh'
alias la='ls -alh'

# lock screen
alias lock='i3lock-fancy'

# volume control
alias mute='amixer set Master mute'
alias unmute='amixer set Master unmute'

# network speed test
alias speedtest='speedtest-cli --simple'

# battery info
alias battery='upower -i $(upower -e | grep 'BAT') \
| grep --color=never -E "time to empty|percentage"'
alias bat='battery'

# disk usage
alias disk='df -h | grep --color=never -e /dev/sd -e Filesystem'

# network manager
alias network='cmst'
alias net='network'

# sound
alias sound='pulsemixer'

# monitors
alias screen='lxrandr'
alias monitor='screen'

## typos
alias pacuar='pacaur'
