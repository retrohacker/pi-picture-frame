#! /usr/bin/env bash

URL=https://pictures.blankenship.io
DEVICE=barbara

function cleanup() {
	rm -rf "${INDEX}"
}
trap cleanup EXIT

# Download the index of available pictures
INDEX="$(mktemp /home/pi/picturesIndex-XXXX)"
wget --output-document "${INDEX}" --header "Referer: ${DEVICE}.blankenship.io" "${URL}/index.csv"


# Iterate through the index and download each image
OLDIFS="$IFS"
IFS=$'\n'
for FILE in $(cat "${INDEX}")
do
	wget --no-clobber --directory-prefix /home/pi/pictures --header "Referer: ${DEVICE}.blankenship.io" "${URL}/${FILE}"
done
IFS="${OLDIFS}"

for FILE in /home/pi/pictures/*
do
	FILENAME="$(basename "${FILE}")"
	if ! grep --silent "^${FILENAME}$" "${INDEX}"
	then
		echo "Removing ${FILE}"
		rm "${FILE}"
	fi
done

