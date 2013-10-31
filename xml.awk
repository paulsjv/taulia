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
	print "<buyer>";
	print "<"id">"$1"</"id">";
	print "<"invoice_number">"$2"</"invoice_number">";
	print "<"buyer">"$3"</"buyer">";
	print "<"amount1">"$4"</"amount1">";
	print "<"currency">"$5"</"currency">";
	print "<"purchase_order">"$6"</"purchase_order">";
	print "<"image_name">"$8"</"image_name">";
	print "<"item_number">"$9"</"item_number">";
	print "<"amount2">"$10"</"amount2">";
	print "<"quantity">"$11"</"quantity">";
	print "</buyer>";

	#// invoice image
	filename = $3"_"$2"_"$8;
	print $7 > filename;

}

END {
	
}