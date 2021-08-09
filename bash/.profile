# shell independent and loaded per session

# add user bins to PATH
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi
if [ -d "$HOME/.emacs.d/bin" ]; then
	PATH="$HOME/.emacs.d/bin:$PATH"
fi
if [ -d "$HOME/.poetry/bin" ]; then
	PATH="$HOME/.poetry/bin:$PATH"
fi
if [ -d "$HOME/.pyenv/" ]; then
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init --path)"
fi

# set environment variables
export DOOMDIR=~/dotfiles/doom-emacs/.doom.d/
export EDITOR=vim
export BROWSER=wslview
