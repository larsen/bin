#!/bin/bash

USAGE="Usage: $0 SCALE IMG1 IMG2 IMG3 ... IMGN"

if [ "$#" == "0" ]; then
	echo "$USAGE"
	exit 1
fi

function make_thumb() {
  EXTENSION=.jpg
  IMAGE=$1
  BASENAME=$(basename -s $EXTENSION $IMAGE)
  THUMBNAME=${BASENAME}-thumb$EXTENSION
  
  convert $IMAGE -scale $SCALE% $THUMBNAME
}

SCALE=$1
shift

for image in "$@"
do
  make_thumb $image
done
