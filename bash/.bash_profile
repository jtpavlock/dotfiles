#
# ~/.bash_profile
#

# load bashrc if it exists
[[ -f ~/.bashrc ]] && . ~/.bashrc

# automatically call startx when logged in to tty1
# note: change `-eq 1` to `-le 3` for tty1-3
if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
