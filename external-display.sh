#!/bin/sh

xrandr --auto
xrandr --output HDMI-2 \
       --primary \
       --left-of eDP-1
