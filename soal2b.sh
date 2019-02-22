#!/bin/bash

#United States
awk -F "," '{ if( $1=="United States" && $7=="2012" ) {b[$4]=b[$4]+$10} } END {for(a in b) {print b[a],",",a} } ' WA_Sales_Products_2012-14.csv | sort -k 1 -n -r | awk -F "," 'NR==1, NR==3 {print $2,$1}'

