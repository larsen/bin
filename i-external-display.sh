#!/bin/bash

function available_positions() {
  for position in --left-of --right-of --above --below --same-as
  do
    echo $position
  done
}

function available_rotations() {
  for rotation in normal right left
  do
    echo $rotation
  done
}

position=$(available_positions | d)
rotation=$(available_rotations | d)

xrandr --auto
xrandr --output HDMI-2 \
       --primary \
       --rotate $rotation \
       $position eDP-1

