#!/bin/bash 

sim="./start-simulator.sh"
$sim &

SIM_PID=$!
echo $SIM_PID

sleep 45

screenshot="/Applications/iOS-Simulator Cropper.app/Contents/MacOS/iOS-Simulator Cropper"
options=( -"p" "2" -"f" "/Users/mike/Desktop/screenshot.png" )
command=( "$screenshot" "${options[@]}" )

# execute it:
"${command[@]}"

kill $SIM_PID
