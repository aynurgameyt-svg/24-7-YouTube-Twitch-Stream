ffmpeg -stream_loop -1 -re -i *video* -stream_loop -1 -re -i (replace this with .mp3 radio station link) -vcodec libx264 -pix_fmt yuvj420p -maxrate 20048k -preset veryfast -r 12 -framerate 30 -g 50 -c:a aac -b:a 128k -ar 44100 -strict experimental -video_track_timescale 1000 -b:v 150000k -f flv  rtmp://iad05.contribute.live-video.net/app/{stream_key for twitch live stream}
#!/bin/bash
while true
do
  # Video indirme
  wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1lflnUIx_BJSdQKS73gaoUi5oO0nmrMH-' -O video.mp4
  
  # Yayına basma
  ffmpeg -re -i video.mp4 -c:v libx264 -preset veryfast -b:v 2500k -maxrate 2500k -bufsize 5000k -pix_fmt yuv420p -g 50 -c:a aac -b:a 128k -f flv "rtmp://a.rtmp.youtube.com/live2/$STREAM_KEY"
  
  # Dosyayı sil ve baştan başla
  rm video.mp4
  sleep 5
done
