#!/bin/bash 

image="$(cat /Users/mike/Desktop/screenshot-__Name__.png | base64)"

body='{"tweetid":"__TweetId__","image":"'$image'"}'

curl -H "Content-Type: application/json" -X POST -d $body -u __BasicAuthUsername__:__BasicAuthPassword__ https://nstweet.brosteins.com/api/tweet