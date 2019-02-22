#!/bin/bash
# crontab
# 14 14 14 2 5 /bin/bash /home/zicoritonda/sisop/SoalShiftModul1/soal1.sh


unzip nature.zip
cd nature
src=`pwd`
#echo $src

for f in *
do
#	echo "new_$f"
	base64 -d $f | xxd -r > "new_$f"
	rm $f
done


