#!/bin/bash

wallDIR="$HOME/Wallpaper/"

Vids=($(find ${wallDIR} -type f \( -name "*.mp4" \)))
VidsRandom=${Vids[ $RANDOM % ${#Vids[@]} ]}

mpvpaper -p -o "--loop-playlist" '*' ${VidsRandom}

