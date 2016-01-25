SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

id=1
for i in $(mpc -h localhost -p 6666 playlist | sed s/" - "/":"/g);do
	t=$(echo -n "$i" | awk -F: '{print $2}')
	a=$(echo -n "$i" | awk -F: '{print $1}')

	if [ "$t" == "" ];then
		t="Unknown Track"
	fi
	if [ "$a" == "" ];then
		t="Unknown Artist"
	fi
	if [ "$id" != "" ];then
		echo "$t:$a:$id"
	fi
	id=$(($id + 1))
done

IFS=SAVEIFS