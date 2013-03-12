# /bin/sh
#
# ~/.xinitrc
#
#
# Executed by startx (run your window manager from here)

# Log settings
##############
errorlog="${HOME}/.xerrors"
if (cp /dev/null "${errorlog}"); then
    chmod 600 "${errorlog}"
    exec >"${errorlog}" 2>&1
fi

# Display settings
##################
# Force LVDS as the primary screen
#xrandr --output LVDS1 --primary

# Resource and keymap settings
##############################
usermodmap="${HOME}/.Xmodmap"
userresources="${HOME}/.Xresources"
sysmodmap="/etc/X11/xinit/.Xmodmap"
sysresources="/etc/X11/xinit/.Xresources"

# Merge resources
[[ -r "${sysresources}" ]]  && xrdb -merge "${sysresources}"
[[ -r "${sysmodmap}" ]]     && xmodmap "${sysmodmap}"
[[ -r "${userresources}" ]] && xrdb -merge "${userresources}"
[[ -r "${usermodmap}" ]]    && xmodmap "${usermodmap}"

# Input settings
################
# Keyboard control, repeat delay and repeat rate
xset r rate 200 30

# Pointer Control, acceleration and threshold
xset m 30/10 4

# Pointer Appearance
xsetroot -cursor_name left_ptr
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# Enable numlock
numlockx on

# Autostart settings
###################
# Deprecated?
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Disable bell
xset -b

## Autostarting Applications (must haves)
#########################################
systemd --user &

# Enable xscreensaver
xscreensaver -no-splash &

# start xcompmgr
#xcompmgr -c -C -t-5 -l-5 -r4.2 -o0.55 -D5&
#xcompmgr_mgr & 

# set xflux settings for 100-watt incandescent 
# http://www.sizes.com/units/color_temperature.htm
#xflux -z 53818 -k 2870
xflux -z 53818 -k 2870 &

# set wallpaper
nitrogen --restore &

# pulseaudio system tray
pasystray &
dropbox start &
conky &

DEFAULT_SESSION=awesome
case $1 in
    awesome)
        exec awesome > $HOME/.logs/awesome.log 2> $HOME/.logs/awesome-error.log
        ;;
    xfce4)
        exec startxfce4
        ;;
    *)
        exec $DEFAULT_SESSION
        ;;
esac


