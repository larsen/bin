function toggle_touchpad_synaptics() {
  TOUCHPAD_STATE=$(synclient -l | grep TouchpadOff | cut -d '=' -f 2)
  if [ $TOUCHPAD_STATE == "1" ]; then
      synclient TouchpadOff=0
  else
      synclient TouchpadOff=1
  fi
}
