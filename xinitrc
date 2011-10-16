#!/bin/sh

# Some fonts, like terminus, are installed in /usr/share/fonts/local
# which is not added to the font path by default
xset +fp /usr/share/fonts/local &
xset fp rehash &

# xbindkeys to enable media keys on Inspiron 1525
xbindkeys &

# Run synaptics deamon to disable touchpad when typing
syndaemon -t -k -i 2 -d &

# Ensure .Xresources applies to rxvt-unicode
xrdb -merge ~/.Xresources &

# Enable Ctrl-Alt-Backspace to restart X
setxkbmap -option terminate:ctrl_alt_bksp &

exec openbox-session
