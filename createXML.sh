#! /bin/bash
echo "List of files:"
awk -f xml.awk loadData_small.csv

DIRS=./*

buyer="<buyers>"
for d in $DIRS
do
	if [ -d "$d" ]; then
		fileNames=$(ls -p ./$d)
		for f in $fileNames
		do
			echo "$d/$f"
			xml=$(cat $d/$f)
			buyer="$buyer$xml"
		done
		rm -R $d
	fi
done
buyer="$buyer</buyers>"
echo "$buyer" > "buyers.xml"
