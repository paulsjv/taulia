#!/usr/bin/awk -f
# https://github.com/paulsjv/taulia.git
BEGIN {FS=","}

NR == 1 {
	csvLineOne = $0;
}

NR != 1 {
	testCmd = "test -d "$3;
	if ( system(testCmd) != 0) {
		makeDir = "mkdir ./"$3;
		system(makeDir);
		close(makeDir);
		lineOne = $3"/aaalineOne"
		print csvLineOne > lineOne;
		close(lineOne);
	}

	csv = $1","$2","$3","$4","$5","$6","$7","$8","$9","$10","$11;

	saveCsv = "./"$3"/buyer-"NR;
	print csv > saveCsv;
	close(saveCsv);
}

END {
	
}