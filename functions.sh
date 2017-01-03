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

function age() {
  echo $(( $(date +%s) - $(date +%s -r "$1") ))
}

function cache() {
  i=1
  cache_file="/tmp/__cache_"
  cmd=""
  while [ $i -le $# ]; do
    cache_file="${cache_file}${!i}"
    cmd="${cmd} ${!i}"
    i=$((i+1))
  done

  if [ ! -f $cache_file ] || [ $(age "$cache_file") -ge 600 ]
    then
      eval $cmd > $cache_file
  fi

  cat $cache_file
}
