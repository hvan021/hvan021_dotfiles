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

if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi
xrdb -merge ~/.Xresources 
numlockx &

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#exec openbox-session
#exec startxfce4
exec i3
