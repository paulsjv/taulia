#!/bin/bash
startTime=$(date)
echo $startTime
echo "===================================="
awk -f xml.awk loadData_small.csv

DIRS=./*

echo "<buyers>" > "buyers.xml"
for d in $DIRS
do
	if [ -d "$d" ]; then
		fileNames=$(ls -p ./$d)
		for f in $fileNames
		do
			xml=$(cat $d/$f)
			echo "$xml" >> "buyers.xml"
		done
		rm -R $d
	fi
done
echo "</buyers>" >> "buyers.xml"
echo "Start Time: " $startTime
echo "End Time: " $(date)