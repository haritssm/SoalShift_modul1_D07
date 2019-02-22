#!/bin/bash

awk -F "," '{ if($7=="2012") {a[$1]=a[$1]+$10} } END {for(b in a) {if(max<a[b]) {nama=b;max=a[b]} } print nama,max }' WA_Sales_Products_2012-14.csv
