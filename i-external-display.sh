#!/bin/sh

function available_positions() {
  for position in --left-of --right-of --above --below
  do
    echo $position
  done
}

position=$(available_positions | d)

xrandr --auto
xrandr --output HDMI-2 \
       --primary \
       $position eDP-1

