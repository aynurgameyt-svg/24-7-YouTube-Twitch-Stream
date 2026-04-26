ffmpeg -stream_loop -1 -re -i *video* -stream_loop -1 -re -i (replace this with .mp3 radio station link) -vcodec libx264 -pix_fmt yuvj420p -maxrate 20048k -preset veryfast -r 12 -framerate 30 -g 50 -c:a aac -b:a 128k -ar 44100 -strict experimental -video_track_timescale 1000 -b:v 150000k -f flv  rtmp://iad05.contribute.live-video.net/app/{stream_key for twitch live stream}
#!/bin/bash
while true
do
  # Senin 2 saatlik işlenmiş videonun linki
  URL="https://drive.google.com/uc?export=download&id=1lflnUIx_BJSdQKS73gaoUi5oO0nmrMH-"
  
  ffmpeg -re -i "$URL" -c:v libx264 -preset veryfast -b:v 3000k -maxrate 3000k -bufsize 6000k -pix_fmt yuv420p -g 50 -c:a aac -b:a 128k -f flv "rtmp://a.rtmp.youtube.com/live2/$STREAM_KEY"
  
  echo "Yayın bitti, tekrar başlatılıyor..."
  sleep 5
done
