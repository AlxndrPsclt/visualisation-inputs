#!/usr/bin/env sh

mkfifo /tmp/videopipe

echo "Video will be available at /tmp/videopipe"
ffmpeg -f v4l2 -i /dev/video0 -filter_complex_script filtergraph.txt -map "[out]" -c:v rawvideo -f nut pipe:1 > /tmp/videopipe

