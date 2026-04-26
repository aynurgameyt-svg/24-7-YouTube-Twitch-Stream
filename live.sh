ffmpeg -stream_loop -1 -re -i *video* -stream_loop -1 -re -i (replace this with .mp3 radio station link) -vcodec libx264 -pix_fmt yuvj420p -maxrate 20048k -preset veryfast -r 12 -framerate 30 -g 50 -c:a aac -b:a 128k -ar 44100 -strict experimental -video_track_timescale 1000 -b:v 150000k -f flv  rtmp://iad05.contribute.live-video.net/app/{stream_key for twitch live stream}
#!/bin/bash
while true
do
  ffmpeg -re -i "https://youtu.be/zDkI6JvSdaY" -c:v copy -c:a copy -f flv "rtmp://a.rtmp.youtube.com/live2/$STREAM_KEY"
done
