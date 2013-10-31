#! /bin/bash
echo "List of files:"

DIRS=./*

for d in $DIRS
do
	if [ -d "$d" ]; then
		buyer="<buyers>"
		fileNames=$(ls -p ./$d)
		for f in $fileNames
		do
			echo "$d/$f"
			xml=$(cat $d/$f)
			buyer="$buyer$xml"
		done
		buyer="$buyer</buyers>"
		echo "$buyer" > "$d.xml"
	fi
done