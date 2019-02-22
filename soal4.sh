#!/bin/bash

file=`date +"%R_%d-%m-%Y.log"`
#echo $file
jam=`date +"%H" | cut -c 2`
jam=$((jam+98))
#echo $jam

if [ $jam -gt 122 ]
then
	jam=$((jam-26))
fi

#jam=71
char=`echo "$jam" | awk '{printf("%c",$0)}'`
#echo $char
ps aux | awk -v val=$char '{ gsub("b",val)} {print}' > $file
