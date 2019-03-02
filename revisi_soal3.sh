#!/bin/bash

while true
do
	pass=`tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 12`
	#pass="PassAda"
	#echo $pass
	low=`echo $pass | grep -c -E "[a-z]+"`
	up=`echo $pass | grep -c -E "[A-Z]+"`
	num=`echo $pass | grep -c -E "[0-9]+"`
	#echo $low
	#echo $up
	#echo $num
	if [[ $low>0 && $up>0 && $num>0 ]]; then
		break
	fi
done

#echo $pass
counter=1

while true
do
	if [ ! -f `echo "password$counter.txt"` ]; then
		#echo "Ga Ada"
		echo $pass > password$counter.txt
		break
	else
		#echo "Ada"
		while read line; do
 			if [ $line = $pass ]; then
				break
			fi
		done < password$counter.txt
		counter=$((counter+1))
		#echo $pass >> password$counter.txt
		#break
	fi
done

