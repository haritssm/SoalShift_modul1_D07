#!/bin/bash

pass=`tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 12`
#pass="PassAda"
echo $pass

counter=1

while true
do
	if [ ! -f `echo "password$counter.txt"` ]; then
		echo "Ga Ada"
		echo $pass > password$counter.txt
		break
	else
		echo "Ada"
		while read line; do
			if [ $line = $pass ]; then
				break
			fi
		done < password$counter.txt
		counter=$((counter+1))
	fi
done

