#!/bin/sh

# Get it up and running!
picom -bcC --experimental-backends --blur-method gaussian --blur-deviation 60 --blur-size 30 & # Compositor
nitrogen --restore & # Wallpaper restore
pulseaudio -D & # Sound, sometimes you have to run pulseaudio -k first.
flameshot & # Screenshot software
dunst &
slstatus & # Bar info
exec startdwm.sh # Window manager
