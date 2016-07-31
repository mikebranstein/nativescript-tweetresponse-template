#!/bin/bash 

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -f|--filename)
    FILENAME="$2"
    shift # past argument
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done

echo $FILENAME

sim="./start-simulator.sh"
$sim &

SIM_PID=$!
echo $SIM_PID

sleep 45

screenshot="/Applications/iOS-Simulator Cropper.app/Contents/MacOS/iOS-Simulator Cropper"
options=( -"p" "2" -"f" "/Users/mike/Desktop/screenshot-$FILENAME.png" )
command=( "$screenshot" "${options[@]}" )

# execute it:
"${command[@]}"

# execute it:
'kill $(jobs -p)'