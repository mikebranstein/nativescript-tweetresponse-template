#!/bin/bash 

SIM_PID=$!

sleep 60

screenshot="/Applications/iOS-Simulator\ Cropper.app/Contents/MacOS/iOS-Simulator\ Cropper"
options=( -"p" "2" -"f" "/Users/mike/Desktop/screenshot_3.png" )
command=( "$screenshot" "${options[@]}" )

# execute it:
"${command[@]}"
