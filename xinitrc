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
#xset m 30/10 4

# Pointer Appearance
#xsetroot -cursor_name left_ptr

# Autostart settings
###################
# Deprecated?
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# SSH Agent
SSHAGENT="/usr/bin/ssh-agent"
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
            eval `$SSHAGENT $SSHAGENTARGS`
                    trap "kill $SSH_AGENT_PID" 0
                    fi


DEFAULT_SESSION=awesome
case $1 in
    openbox)
        exec openbox
        ;;
    awesome)
        exec awesome
        ;;
    *)
        exec $DEFAULT_SESSION
        ;;
esac

