#!/bin/bash

# for elinks setting see
# https://urukrama.wordpress.com/2010/01/02/watching-youtube-videos-in-elinks/

# format is playable on 900MHz Intel Celeren (socket 370) and 32MB GeForce2 MX AGP

tmp_dir=$(mktemp -d)

video_format="best[height<=480]"
video_name="$tmp_dir/%(title)s-%(height)03d-%(id)s.%(ext)s"

youtube-dl -f $video_format -o $video_name $1

mplayer -fs $tmp_dir/*

rm $tmp_dir/*
