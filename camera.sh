#!/bin/bash
while true
do
	timestamp=$(date +"%Y-%m-%d %H:%M:%S")
	hour=$(date +%H)
	length=$(( (3600 - $(date +%s) % 3600) * 1000 )) 

	echo It is $timestamp. Starting new video with a length of $length ms...

	libcamera-vid \
		--output raw$hour \
		-t $length \
		--nopreview
	
	time ffmpeg -i raw$hour -b 150k "out/$timestamp.mkv" &&
	rm raw$hour & # convert in the background and then remove raw
done

