echo "List of files:"
awk -f csv.awk loadData_small.csv

DIRS=./*

for d in $DIRS
do
	if [ -d "$d" ]; then
		buyer=""
		fileNames=$(ls -p ./$d)
		for f in $fileNames
		do
			echo "$d/$f"
			xml=$(cat $d/$f)
			buyer="$buyer\n\r$xml"
		done
		buyer="$buyer"
		echo -e "$buyer" > "$d.csv"
		rm -R $d
	fi
done