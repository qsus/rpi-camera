# rpi-camera
WARNING: Work in progress!

This script will record videos from Raspberry Pi and upload them to VPS. Then you can:
- Download the files to your PC
- Write a server backend so you can easily access them
- Use my simple server backend [rpi-camera-server](https://github.com/qsus/rpi-camera-server)

This script will record an hour long videos (except the first one), while making sure that each video ends in XX:00. After each recorded video, upload.sh is executed in paralel, which will first convert the video to .mkv with a custom bitrate and then upload it to VPS.

## Prerequisites
* VPS with public IP
## Usage
1. Configure public key authentication so you can access your VPS from your RPi without password.
2. Copy .env.example to .env and replace the example values.
3. Run `./camera.sh` on your RPi.
