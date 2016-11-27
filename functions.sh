function toggle_touchpad_synaptics() {
  TOUCHPAD_STATE=$(synclient -l | grep TouchpadOff | cut -d '=' -f 2)
  if [ $TOUCHPAD_STATE == "1" ]; then
      synclient TouchpadOff=0
  else
      synclient TouchpadOff=1
  fi
}

XINPUT=/usr/bin/xinput

function touchpad_device_number() {
  local TOUCHPAD_DEVICE_NUMBER=$($XINPUT list | grep Touchpad | sed -nr 's/.*id=([0-9]+).*/\1/p')
  echo $TOUCHPAD_DEVICE_NUMBER
}

function toggle_touchpad_libinput() {
  TOUCHPAD_STATE=$(touchpad_device_number)
  if [ $TOUCHPAD_STATE == "1" ]; then
      xinput --disable $TOUCHPAD_DEVICE_NUMBER
  else
      xinput --enable $TOUCHPAD_DEVICE_NUMBER
  fi
}
