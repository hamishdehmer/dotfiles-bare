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

# Get it up and running!
picom -bcC --experimental-backends --blur-method gaussian --blur-deviation 60 --blur-size 30 &
nitrogen --restore &
pulseaudio -D &

# Bar
while true; do
	xsetroot -name "$(echo VOLUME:) $(amixer | awk '/Left:/ {print $5}') $(echo '|') $( date +"%F %R" )"
   sleep 1s    # Update time every minute
done &

exec dwm
