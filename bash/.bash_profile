#
#/.bash_profile
#

# load bashrc if it exists
[[ -f ~/.bashrc ]] && . ~/.bashrc

# set PATH so it includes user's private bins if they exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.emacs.d/bin" ] ; then
    PATH="$HOME/.emacs.d/bin:$PATH"
fi

# map capslock to escape
setxkbmap -option caps:escape

