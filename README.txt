1. User guide
1.1 Overview
1.2 Features list

2. Tech Spec
2.1 Architecture HIGH
2.2 Build
2.3 Deploy

3. Contact and questions

1. User guide
In this section is information for users as product description and how to use existing product without code change etc.

1.1 Overview
This is RTMP player for streaming playing video. 
It is based on livestream.com JavaScript API and have a external functionality with livestream.com RMTP videos. 
All other RTMP video stream should play correctly without extra features.

1.2 Features list
Player control panel:
- play\pause button
- sound on\off button
- full screen\windowed 
- seek bar - only show current time play (for videos from  livestream.com: all time from JS API )
Also there is visual interface for seek with time show, but rewind itself not supported with stream
- Live button - put seek bar to max right position ( current play )
HTML\JavaScript control:
- if video from video list (API support) appear button FOLLOW or UNFOLOW depend from current status for played video.
- list with 3 video stream from livestream.com. If you will push WATCH button - video will be played by player.
- text field with possiable to enter any of RTMP video. (in this case extra features will be not able)
- if you will enter RTMP in GET - it will be default video for player:
(EXAMPLE http://antondavidenko.com/player/index.html?rtmp=rtmp://cp79650.live.edgefcs.net/live/QVCLive1@14308)
  
2. Tech Spec
This is simple AS3 player, without any addirion library used.
It not required any additional SWC or *.as libs. (Only standart AS3 packages)
  
2.1 Architecture HIGH
On hight LEVEL it is MVC model pattern:
PlayerAS3 - facade and enrey point
Controller - CommandsManager and numer of Commands to execute (kind of command pattern)
Data - player global data 
View - have a two big parts:
View.ui - components system
View.player - video player
  
2.3 Build
Entry point for compiller is: PlayerAS3.as
source folder is: src
To make HtML\JS features works require files:
bin\index.html
bin\index.js

2.3 Deploy
It wont works localy due a browser restriction
Also livestream.com API require to use POST\DELETE method. 
This means that player should be in same domain with livestream.com.
From there you have 2 options:
- upload binary files to livestream.com subfolder ( for example: http://new.livestream.com/playerAS3 )
- use Charles Web Development tool to map local files with http://new.livestream.com/playerAS3 (or another subfolder)
To test API I was use Charles =)

3. Contact and questions
You can contact me if you have any questions: anton.davidenko@gmail.com