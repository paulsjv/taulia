#!/bin/bash
startTime=$(date)
echo "===================================="
awk -f csv.awk loadData_small.csv

DIRS=./*

for d in $DIRS
do
	if [ -d "$d" ]; then
		buyer=""
		count=1
		fileNames=$(ls -p ./$d)
		for f in $fileNames
		do
			xml=$(cat $d/$f)
			if [ "$count" -eq 1 ]; then
				buyer="$xml"
			else
				buyer="$buyer\n$xml"
			fi
			count=$(expr $count + 1)
		done
		buyer="$buyer"
		echo -e "$buyer" > "$d.csv"
		rm -R $d
	fi
done
echo "Start Time: " $startTime
echo "End Time: " $(date)