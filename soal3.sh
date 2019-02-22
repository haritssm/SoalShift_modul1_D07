#!/bin/bash

pass=`tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 12`
#pass="PassAda"
echo $pass

counter=1
dr=`pwd`
echo $dr
num=`ls | sort -k 1.9 -n -r | head -c 9 | cut -b 9`
if [ -z "$num" ];then
	num=1
fi 
#num=$((num+1))
echo "num = $num"
for n in {0..$num}
do
	if [ -f `echo "password$counter.txt"` ]; then
		#echo $pass >> password$counter.txt
		while read line; do
			if [ $line = $pass ]; then
				echo "Ada ternyata bro"
				counter=$((counter+1))
				check=0
				#echo $counter
				#echo $pass >> password$counter.txt
				break 
			else
				echo "keliatannya ga ada bro"
				check=1
			fi
		done < password$counter.txt

		if [ $check -eq 1 ];then
			echo $pass >> password$counter.txt
		fi
	else
		echo "mantap"
		echo $pass >> password$counter.txt
		counter=$((counter+1))
	fi
done

