# shell independent and loaded per session

# add user bins to PATH
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.emacs.d/bin" ] ; then
    PATH="$HOME/.emacs.d/bin:$PATH"
fi
if [ -d "$HOME/.poetry/bin" ] ; then
    PATH="$HOME/.poetry/bin:$PATH"
fi

export DOOMDIR=~/dotfiles/doom-emacs/.doom.d/
