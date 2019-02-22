#!/bin/bash

#United States
#Personal Accessories
#Camping Equipment
#Outdoor Protection

awk -F "," '{if($1=="United States" && $7=="2012" && $4=="Personal Accessories"){A[$5]=A[$5]+$10}} END{for(a in A){print A[a],",",a}}' WA_Sales_Products_2012-14.csv | sort -k 1 -n -r | awk -F "," 'NR==1 {print "Personal Accessories : ",$2}'

awk -F "," '{if($1=="United States" && $7=="2012" && $4=="Camping Equipment"){A[$5]=A[$5]+$10}} END{for(a in A){print A[a],",",a}}' WA_Sales_Products_2012-14.csv | sort -k 1 -n -r | awk -F "," 'NR==1 {print "Camping Equipment : ",$2}'

awk -F "," '{if($1=="United States" && $7=="2012" && $4=="Outdoor Protection"){A[$5]=A[$5]+$10}} END{for(a in A){print A[a],",",a}}' WA_Sales_Products_2012-14.csv | sort -k 1 -n -r | awk -F "," 'NR==1 {print "Outdoor Protection : ",$2}'

