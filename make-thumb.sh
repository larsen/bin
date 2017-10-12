#!/bin/bash

function make_thumb() {
  EXTENSION=.jpg
  IMAGE=$1
  BASENAME=$(basename -s $EXTENSION $IMAGE)
  THUMBNAME=${BASENAME}-thumb$EXTENSION
  
  convert $IMAGE -scale 10% $THUMBNAME
}

for image in "$@"
do
  make_thumb $image
done
