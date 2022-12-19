timestamp=$1
. .env

time ffmpeg \
	-i "$timestamp.raw" \
	-b $bitrate \
	"out/$timestamp.mov" |
tee --append logs/ffmpeg.log

rm "$timestamp.raw"

rsync "out/$timestamp.mkv" "$destination"
