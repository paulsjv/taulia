#!/usr/bin/awk -f
# https://github.com/paulsjv/taulia.git
BEGIN {FS=","}

NR == 1 {
	id 				= $1;
	invoice_number 	= $2;
	buyer 			= $3;
	amount1			= $4;
	currency 		= $5;
	purchase_order 	= $6;
	invoice_image	= $7;
	image_name		= $8;
	item_number		= $9;
	amount2			= $10;
	quantity		= $11;
}

NR != 1 {
	if ( system("test -d" $3) == 0) {
		#print buyer " does not exist.";
		system("mkdir ./" $3);
	}

	xml = "<buyer><"id">"$1"</"id"><"invoice_number">"$2"</"invoice_number"><"buyer">"$3"</"buyer"><"amount1">"$4"</"amount1"><"currency">"$5"</"currency"><"purchase_order">"$6"</"purchase_order"><"image_name">"$8"</"image_name"><"item_number">"$9"</"item_number"><"amount2">"$10"</"amount2"><"quantity">"$11"</"quantity"></buyer>";

	saveXml = "./"$3"/buyer-"NR;
	print xml > saveXml;
	close(saveXml);

	#// invoice image
	fileName = $3"_"$2"_"$8;
	saveImage = "./"$3"/"fileName;
	print $7 > saveImage;
	close(saveImage);


}

END {
	
}