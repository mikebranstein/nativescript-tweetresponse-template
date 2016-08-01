#!/bin/bash 

# BEGIN COMMAND LINE ARGS PARSING
while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -f|--filename)
    FILENAME="$2"
    shift # past argument
    ;;
    -t|--tweetid)
    TWEETID="$2"
    shift #past argument
    ;;
    -u|--username)
    USERNAME="$2"
    shift #past argument
    ;;
    -p|--password)
    PASSWORD="$2"
    shift #past argument
    ;;
    *)
            # unknown option
    ;;
esac
shift # past argument or value
done
# END COMMAND LINE ARGS PARSING

echo "FILENAME = "$FILENAME
echo "TWEETID = "$TWEETID
echo "USERNAME = "$USERNAME
echo "PASSWORD = "$PASSWORD

#image="$(cat /Users/mike/Desktop/screenshot-"$FILENAME".png | base64)"
#auth="$(echo -n "$USERNAME":"$PASSWORD" | base64)"

body='{"tweetid":"'$TWEETID'","image":"'$image'"}'

echo="echo"
httpie="http"
options=( "POST" "https://nstweet.brosteins.com/api/tweet" "body='$body'" --ignore-stdin  --"auth" "$USERNAME:$PASSWORD" --"json" )
command=( "$httpie" "${options[@]}" )

# execute it:
"${command[@]}"