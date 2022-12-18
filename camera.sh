#!/bin/bash

while true
do
	timestamp=$(date +"%Y-%m-%d %H:%M:%S")
	length=$(( (3600 - $(date +%s) % 3600) * 1000 )) 

	echo It is $timestamp. Starting new video with a length of $length ms...

	libcamera-vid \
		--output "$timestamp.raw" \
		-t $length \
		--nopreview |
	tee --append logs/libcamera.log
	
	./upload.sh "$timestamp" & # convert and upload in the background
done

