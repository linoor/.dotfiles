#!/bin/bash

PHOTO_DIRECTORY=~/Downloads
FILENAME=$(cd $PHOTO_DIRECTORY ; ls -Art | tail -n 1)

# copy the latest file from the Downloads directory to the MegaSync Olya's directory
if [[ "$FILENAME" != *jpg ]]
then
	echo "the latest file ($FILENAME) is not a .jpg file, something's wrong."
	exit
else
	mv $PHOTO_DIRECTORY/$FILENAME ~/MEGAsync/фотки\ Оля/
	echo "$FILENAME successfully copied."
fi
