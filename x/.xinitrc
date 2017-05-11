#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi


### USER CONFIGURATIONS

# laptop vs external configs
EXTERNAL_OUTPUT1="VGA1"
EXTERNAL_OUTPUT2="HDMI3"
INTERNAL_OUTPUT="eDP1"

xrandr | grep $EXTERNAL_OUTPUT1 | grep " connected "
if [ $? -eq 0 ]; then
    # externals connected

    # setup monitors and disable laptop screen
    xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT1 --auto \
           --output $EXTERNAL_OUTPUT2 --auto --left-of $EXTERNAL_OUTPUT1

    # launch polybar on both screens
    # delay to launch after i3
    (sleep 5; \
     /home/jacob/.config/polybar/launch $EXTERNAL_OUTPUT2) &

else
    # no externals--only laptop
    xrandr --output $INTERNAL_OUTPUT --auto

    # launch polybar on laptop screen
    # delay to launch after i3
    (sleep 5; \
     /home/jacob/.config/polybar/launch $INTERNAL_OUTPUT) &
fi

# remap caps lock to act as escape key (doesn't swap)
setxkbmap -option caps:escape

# use "udiskie" to automatically mount usb devices
udiskie &

# start i3
exec i3
# exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&      # for logging i3 output
