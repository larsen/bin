#!/bin/bash

APOD_ROOT=~/Pictures/apod
LASTEST_AVAILABLE_DIR=$(ls -1 -r $APOD_ROOT/ | head -n 1)
LASTEST_AVAILABLE_IMAGE=$(ls -1 $APOD_ROOT/$LASTEST_AVAILABLE_DIR/*.jpg)

feh --bg-fill $LASTEST_AVAILABLE_IMAGE
