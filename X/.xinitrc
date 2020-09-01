[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap

# capslock is another escape; shift+capslock is normal capslock
setxkbmap -option caps:escape_shifted_capslock
