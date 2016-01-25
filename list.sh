SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

j=1	


if [ $# -gt 1 ];then
	#Showing tracks by artist
	q=$(echo "$@" | sed "s/$1 //g")
	echo "<p class=text>$q</p>"
	for i in $(cat database | grep "$q");do
		title=$(echo "$i" | awk -F: '{print $1}')
		id=$(echo "$i" | awk -F: '{print $3}')

		echo "<p><button class='full button' onclick=playSong(\"$id\")>$title</button></p>"
	done
else

	#Showing artists
	if [ "$1" == "artist" ];then
		# for i in $(cat database | aw)
		for i in $(mpc -h localhost -p 6666 list "$@" | sort);do
			s=$(echo "$i" | sed s/" "/"%20"/g)
			echo "<p><button class='full button' onclick=showTracks(\"$s\")>$i</button></p>"
			j=$(($j + 1))
		done
	#Showing tracks
	else
		lastLetter="A"
		currLetter="A"
		alreadyPrinted="f"
		echo "<input class=\"full button\" placeholder=\"Type Here to Jump to a Letter Or Song\" id=letterPicker onchange=jumpToLetter()></input>"
		for i in $(cat database);do
			title=$(echo "$i" | awk -F: '{print $1}')
			artist=$(echo "$i" |  awk -F: '{print $2}')
			id=$(echo "$i" | awk -F: '{print $3}')

			#TODO
			#Add letter nav here

			firstLetter=$(echo "$title" | grep "^[[:alpha:]]" -o)
			# echo -e "\n$firstLetter\n"
			# if [ "$firstLetter" == "$lastLetter" ];then
			# 	if [ "$alreadyPrinted" == "f" ];then
			# 		echo "<p>$firstLetter</p>"
			# 		echo -e "\n$firstLetter\n"
			# 		lastLetter="$firstLetter"	
			# 		alreadyPrinted="t"
			# 	fi
			# else
			# 	alreadyPrinted="f"
			# fi

			if [ "$id" != "" ];then
				echo "<p id=l$firstLetter><button class='full button' onclick=playSong(\"$id\")><b class=title>$title</b><br><i class=artist>$artist</i></button></p>"
			fi
		done

	fi

fi
IFS=SAVEIFS
