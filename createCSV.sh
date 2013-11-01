#!/bin/bash
startTime=$(date)
echo "===================================="
awk -f csv.awk loadData_small.csv

DIRS=./*

for d in $DIRS
do
	if [ -d "$d" ]; then
		count=1
		fileNames=$(ls -p ./$d)
		for f in $fileNames
		do
			xml=$(cat $d/$f)
			if [ "$count" -eq 1 ]; then
				echo "$xml" >> "$d.csv"
			else
				echo -e "\n$xml" >> "$d.csv"
			fi
			count=$(expr $count + 1)
		done
		rm -R $d
	fi
done
echo "Start Time: " $startTime
echo "End Time: " $(date)