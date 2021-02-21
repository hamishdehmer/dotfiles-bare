#!/bin/sh

### Font Configuration
xrdb -merge $HOME/.Xresources

### Screen configuration
./.screenlayout/dualscreens.sh

# Get it up and running!
picom -bc & # Compositor
nitrogen --restore & # Wallpaper restore
# redshift-gtk & # Bluelight reduction
pipewire & # Sound, sometimes you have to run pulseaudio -k first. (for some reason it only seems to happen on newer kernels...)
flameshot & # Screenshot software
dunst & # Notifications
# slstatus & # Bar info
protonvpn c -f &
# tint2 &
exec qtile start
# exec openbox-session
# exec startdwm.sh # Window manager
# exec xmonad
