#!/bin/bash

MUSIC=~/Music/
chosen=$(find -L $MUSIC -type d | cut -c $(echo $MUSIC | wc -c)- | dmenu -fn "Droid Sans Mono-16" -l 10 -i)

if [ "$chosen" != "" ]; then
  mpc clear 
  mpc add "$chosen"
  mpc play
fi
