#! /usr/bin/env bash

LIST=pictures.list

while true
do
	find ./pictures -type f | sort --random-sort > "${LIST}"
	feh --auto-zoom --borderless --filelist "${LIST}" --fullscreen --image-bg black --slideshow-delay 5
done
