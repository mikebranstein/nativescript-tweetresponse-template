# About

This repository contains a NativeScript app template used by the automated tweet response system. 

# How to Use

You can use the code form this project in 2 ways: tweeting [@MikeBranstein](https://twitter.com/mikebranstein) with the hashtag [#makemeanapp](https://twitter.com/search?q=%23makemeanapp), or by cloning the repository and manually running the project.

Note: as of August 22, 2016, the automated tweet response method will be decommissioned. 

## Running the code by tweeting

First things, first. Am I serious? Yes. 

Tweet [@MikeBranstein](https://twitter.com/mikebranstein) and include the hashtag [#makemeanapp](https://twitter.com/search?q=%23makemeanapp) in the tweet and I'll send you a screenshot of your app running in an emulator. Yeah seriously. It's real. No tricks. 

If it's after August 22, 2016, continue reading ot learn how you can run this code by yourself.

### After you tweet

Once you've tweeted [@MikeBranstein](https://twitter.com/mikebranstein), be patient: a lot is going on behind the scenes. Here's a breakdown of the whole process:
1. An Azure Logic App monitors Twitter for mentions of [@MikeBranstein](https://twitter.com/mikebranstein) and [#makemeanapp](https://twitter.com/search?q=%23makemeanapp) 
2. For each mention found, an HTTP call is made to an automated Visual Studio Team Services (VSTS) build process to queue a build
  * The logic app passes the tweet id and tweeting user's name to the build service. these are stored as variables used throughout the build process.
3. Build executes
  1. Build agent running on my Mac begins the automated build process
  2. This repository is downloaded
  3. The `__Name__` placeholder within the `app\main-page.xml` file is replaced with the tweeting user's name
  4. `tns platform add ios` is run to add the ios platform to the NativeScript project
  5. `tns run ios --emulator` is run to start the iOS emulator on the build machine
  6. A screenshot is taken of the iOS emulator and stored on the build machine
  7. An HTTPS post is made to a secure REST api endpoint, requesting a reply tweet to be made, posting the original tweet id and screenshot 
4. REST api "tweet" endpoint is called
  1. An OAuth token is requested from the Twitter API
  2. The original tweet is retrieved, pulling the original tweeter's name
  3. The screenshot is uploaded to twitter
  4. A new tweet is sent, replying to the original tweet, and attaching the uploaded screenshot
5. You receive a tweet back from me, with the iOS simulator's screenshot! Pretty cool!

This processes takes about 3-4 minutes, so please be patient. 

## Running the code yourself

To use this code, clone the repository:

`> git clone https://github.com/mikebranstein/nativescript-tweetresponse-template`

After cloing the repository, install the ios platform and run the app in the iOS simulator:

`> tns platform add ios`
`> tns run ios --emulator`

If you prefer Android, install the android platofrm and run in the Android emulator:

`> tns platform add android`
`> tns run android`

## Prerequisites

If you're running this code, please have NativeScript v2.1 (minimum) installed. For more information, check out the [NativeScript documentation](https://docs.nativescript.org).

