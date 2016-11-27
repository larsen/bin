function toggle_touchpad_synaptics() {
  TOUCHPAD_STATE=$(synclient -l | grep TouchpadOff | cut -d '=' -f 2)
  if [ $TOUCHPAD_STATE == "1" ]; then
      synclient TouchpadOff=0
  else
      synclient TouchpadOff=1
  fi
}

function toggle_touchpad_libinput() {
  TOUCHPAD_DEVICE_NUMBER=$(xinput list | grep Touchpad | sed -nr 's/.*id=([0-9]+).*/\1/p')
  TOUCHPAD_STATE=$(xinput list-props 11 | grep "Device Enabled" | cut -d: -f 2 | sed -nr 's/\s//gp')
  if [ $TOUCHPAD_STATE == "1" ]; then
      xinput --disable $TOUCHPAD_DEVICE_NUMBER
  else
      xinput --enable $TOUCHPAD_DEVICE_NUMBER
  fi
}
