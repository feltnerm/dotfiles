#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# exec awesome
# exec fluxbox
# exec blackbox


DEFAULT_SESSION=xfce4
case $1 in
gnome)
	gsynaptics-init &
	exec ck-launch-session gnome-session
	;;
kde)
    gsynaptics-init &
    exec ck-launch-session startkde
    ;;
xfce4)
    gsynaptics-init &
    exec startxfce4 --with-ck-launch
    ;;
fluxbox)
	gsynaptics-init &
	exec ck-launch-session startfluxbox
	;;
awesome)
	xcompmgr &
	gsynaptics-init &
	exec awesome
	;;
blackbox)
	gsynaptics-init &
	exec blackbox
	;;
openbox)
	gsynaptics-init &
	exec openbox-session
    ;;
qtile)
    gsynaptics-init &
    exec qtile
    ;;
*)
	#syndaemon -t -k -i 2 -d &
	gsynaptics-init &
	exec $DEFAULT_SESSION
	;;
esac
