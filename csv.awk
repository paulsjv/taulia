#!/usr/bin/awk -f
# https://github.com/paulsjv/taulia.git
BEGIN {FS=","}

NR == 1 {
	csvLineOne = $0;
}

NR != 1 {
	if ( system("test -d" $3) == 0) {
		system("mkdir ./" $3);
		lineOne = $3"/aaalineOne"
		print csvLineOne > lineOne;
	}

	csv = $1","$2","$3","$4","$5","$6","$7","$8","$9","$10","$11;

	saveCsv = "./"$3"/buyer-"NR;
	print csv > saveCsv;
	close(saveCsv);
}

END {
	
}