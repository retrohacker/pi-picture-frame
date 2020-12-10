#! /usr/bin/env bash

LIST=pictures.list

while true
do
	find ./pictures -type f | sort --random-sort > "${LIST}"
	feh --auto-zoom --auto-rotate --borderless --filelist "${LIST}" --fullscreen --image-bg black --slideshow-delay 6
done
