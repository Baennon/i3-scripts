#!/bin/sh
while true; do
	mediaName="$(playerctl metadata title)"
	if [ ${#mediaName} -ge 73 ]; then
		mediaName="$(echo $mediaName | cut -c 1-69)..."
	fi;
	mediaArtist="$(playerctl metadata artist)"
	if [ ${#mediaArtist} -ge 73 ]; then
		mediaArtist="$(echo $mediaArtist | cut -c 1-69)..."
	fi;
	mediaAlbum="$(playerctl metadata album)"
	if [ ${#mediaAlbum} -ge 73 ]; then
		mediaAlbum="$(echo $mediaAlbum | cut -c 1-69)..."
	fi;
	echo -e "\n\n\n\n"
	echo -e "\n"
	echo -e "     $mediaName\n"
	echo -e "     $mediaArtist\n"
	echo -e "     $mediaAlbum"
	sleep 2
done
