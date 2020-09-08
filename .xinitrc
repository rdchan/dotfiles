#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap


# start some nice programs
xrdb ~/.Xresources &
xbindkeys
xset r rate 180 40
exec "awesome"
