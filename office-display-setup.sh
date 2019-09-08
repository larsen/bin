#!/bin/sh
xrandr --output HDMI-2 --left-of eDP-1 --mode 1920x1080 \
       --output DP-1 --primary --left-of HDMI-2 --mode 1920x1080 \
       --output eDP-1 --auto
