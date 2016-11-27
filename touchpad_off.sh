#!/bin/bash

source /home/larsen/bin/functions.sh

export XAUTHORITY=/home/larsen/.Xauthority
export DISPLAY=:0.0

TOUCHPAD_DEVICE_NUMBER=$(touchpad_device_number)
xinput --disable $TOUCHPAD_DEVICE_NUMBER
