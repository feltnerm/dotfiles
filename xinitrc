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
#xsetroot -cursor_name left_ptr

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
#
# Disable bell
xset -b

# SSH Agent
SSHAGENT="/usr/bin/ssh-agent"
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
    eval `$SSHAGENT $SSHAGENTARGS`
    trap "kill $SSH_AGENT_PID" 0
fi

## Autostarting Applications (must haves)
#########################################

# Start pulseaudio
pulseaudio --check || start-pulseaudio-x11

# Enable xscreensaver
xscreensaver -no-splash &

# start xcompmgr
#xcompmgr -c -C -t-5 -l-5 -r4.2 -o0.55
xcompmgr -CcfF -I-.015 -O-.03 -D2 -t-1 -l-3 -r4.2 -o.5 &

# start urxvt daemon
urxvtd -q -f -o

# set wallpaper
nitrogen --restore &
DEFAULT_SESSION=awesome
case $1 in
    awesome)
        exec awesome
        ;;
    *)
        exec $DEFAULT_SESSION
        ;;
esac

