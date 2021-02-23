# This script is for making barcodes for the Culture Collection
# Label template designed in ZebraDesigner 3, 'printed' to .prn
# modified to .zpl format

# set working directory
setwd("/home/sean/Documents/LabelFormats/zebra")


# Read in ZPL template
zpl_raw <-readLines(con = "SW_tube_dot_label.zpl")
zpl_edit <- zpl

# start off barcode number
x = 1000001
outfile = "output.zpl"
barcode_n = 5

# Overwrite output file if it exists
if(file.exists(outfile)){
file.remove(outfile)
}

for(a_barcode in c(x:(x+barcode_n))){
# Replace the barcode parts with new numbers
# Tube barcode
zpl_edit[26] <- sub("0000000", a_barcode, zpl_raw[26])

# Cap barcode
zpl_edit[28] <- sub("0000000", a_barcode, zpl_raw[28])

# write to file
sink(file = outfile, append = T)
cat(zpl_edit, sep = "\n")
sink()
}


