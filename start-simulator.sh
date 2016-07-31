#!/bin/bash 

echo "starting simulator..."

tns="tns"
options=( "run" "ios" --"emulator" )
command=( "$tns" "${options[@]}" )
# execute it:
"${command[@]}"
