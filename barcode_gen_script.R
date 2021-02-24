# This script is for making barcodes for the Culture Collection
# Label template designed in ZebraDesigner 3, 'printed' to .prn
# modified to .zpl format

# set working directory
setwd("/home/sean/Documents/LabelFormats/zebra")

# Define files and parameters
# start off barcode number
x = 1000001
template_bcode = "0000000"
outfile = "output.zpl"
barcode_n = 500
zpl_file = "SW_tube_dot_label_v2.zpl"
barcode_log_file = "barcode_print_log.txt"

# Read in ZPL template
zpl_raw <-readLines(con = zpl_file)
# Overwrite output file if it exists
if(file.exists(outfile)){
file.remove(outfile)
print("removing old print file")
}

# loop through new barcodes
print("adding new barcodes to print file:")
for(a_barcode in c(x:(x+barcode_n))){
	# Replace the barcode parts with new numbers
	zpl_edit <- sub(template_bcode, a_barcode, zpl_raw)
	print(a_barcode)
	# write print instructions to file
	sink(file = outfile, append = T)
	cat(zpl_edit, sep = "\n")
	sink()

	# write barcodes printed to log
	sink(file=barcode_log_file, append = T)
	print(paste(a_barcode,
		    date(),
		    zpl_file,
		    sep = ","))
	sink()
}

