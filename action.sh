#!/bin/bash
mpc -h localhost -p 6666 "$@" >> /dev/null

d=$(mpc -h localhost -p 6666)

file="/Music/$(mpc -h localhost -p 6666 current -f "%file%" | sed s/" "/"%20"/g)"
state=$(echo "$d" | grep "\[playing\]" | wc -l)
artist=$(echo "$d" | grep " - " | sed s/" - .*$"//g)
safeartist=$(echo "$artist" | sed s/" "/"%20"/g)
track=$(echo "$d" | grep " - " | sed s/"^.* - "//g)
random=$(echo "$d" | grep "random: [[:alpha:]]*" -o | sed s/"random: "//g)

if [ "$artist" == "" ];then
	artist="Unknown Artist"
fi

if [ "$track" == "" ];then
	track="Unknown Track"
fi

echo "<p class=\"full text\" id=info>";
echo "<span id=state style=visibility:hidden;position:fixed>$state</span>";
echo "<b onclick=getSong(\"$file\") id=track>$track</b> by <b onclick=showTracks(\"$safeartist\") id=artist>$artist</b></p>";

if [ "$state" == "0" ];then
	p="Play"
else
	p="Pause"
fi

echo "<p><button class=\"half button\" onclick=musicAction(\"random\")>Shuffle is $random</button></p>"
echo "<p><button id=playbutton class=\"full button\" onclick=musicAction(\"toggle\")>$p</button></p>"

