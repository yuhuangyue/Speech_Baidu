#!/bin/bash

video_len=$2
begin=0
filename=$1
gap=30
echo "处理的视频为：$1"
echo "视频的长度为：$2"
while [ $begin -lt $video_len ]
do
    echo $begin
    #end=$(($begin + $gap))
    clipname=$begin".pcm"
    ffmpeg -i $filename -ss $begin -t $gap -acodec pcm_s16le -f s16le -ac 1 -ar 16000 $clipname
    PYTHONIOENCODING=utf-8 python speech.py $clipname
    rm -r $clipname
    begin=$(($begin + $gap))
done


# ffmpeg -i source-file.foo -ss 0 -t 600 first-10-min.m4v