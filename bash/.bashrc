#
#/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# define aliases in a separate file
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

# define prompt in a separate file
if [ -f ~/.bash_prompt ]; then
        . ~/.bash_prompt
fi

# define functions in a separate file
if [ -f ~/.bash_functions ]; then
        . ~/.bash_functions
fi
