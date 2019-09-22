#!/bin/bash

APOD_ROOT=~/Pictures/apod

case "$1" in
	pick)
		BACKGROUND_IMG_DIR=$(ls $APOD_ROOT | d)
		;;
	*)
                BACKGROUND_IMG_DIR=$(ls -1 -r $APOD_ROOT/ | head -n 1)
		;;
esac

LASTEST_AVAILABLE_IMAGE=$(ls -1 $APOD_ROOT/$BACKGROUND_IMG_DIR/*.jpg)

feh --bg-fill $LASTEST_AVAILABLE_IMAGE
