# record the screen and convert to gif
screenrec() {
    local VIDEO_PATH=~/Desktop/screenrec.mp4
    local GIF_PATH=~/Desktop/screenrec.gif
    local FPS=30
    local WIDTH=1920
    local HEIGHT=1080
    local SCREEN_CAP_DEVICE_INDEX=$(ffmpeg -f avfoundation -list_devices true -i "" 2>&1 | rg 'Capture screen' | rg -o '\[\d+\]' | tr -d '[]')
    local DISPLAY_SOURCE="$SCREEN_CAP_DEVICE_INDEX:"  # screen capture:no audio

    echo "Recording screen... Press Ctrl+C to stop."

    # record screen in background
    ffmpeg -video_size ${WIDTH}x${HEIGHT} -framerate $FPS -f avfoundation -capture_cursor 1 -i $DISPLAY_SOURCE "$VIDEO_PATH" < /dev/null &

    trap 'echo "Stopping recording..."; killall INT ffmpeg;  convert_to_gif' SIGINT

    wait $!

    # remove trap
    trap - SIGINT

    echo "Screen recording stopped."
}

convert_to_gif() {
    local VIDEO_PATH=~/Desktop/screenrec.mp4
    local GIF_PATH=~/Desktop/screenrec.gif
    local FPS=10

    echo "Converting to GIF..."
    sleep 1  # wait for ffmpeg to finish writing the video file
    ffmpeg -i "$VIDEO_PATH" -vf "fps=$FPS,scale=1000:-1:flags=lanczos" -c:v gif "$GIF_PATH" -y

    echo "GIF saved to $GIF_PATH"

    # Clean up temporary video file
    rm -f "$VIDEO_PATH"
}
