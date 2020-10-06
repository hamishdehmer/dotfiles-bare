#!/bin/sh

# Get it up and running!
picom -bc & # Compositor
nitrogen --restore & # Wallpaper restore
redshift-gtk & # Bluelight reduction
pulseaudio -D & # Sound, sometimes you have to run pulseaudio -k first.
flameshot & # Screenshot software
dunst & # Notifications
slstatus & # Bar info
exec startdwm.sh # Window manager
#exec fvwm3
