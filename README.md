# zebra_barcode_script
Short script to generate unique barcoded labels for a Zebra GK420t using a ZPL template.
Each label has a tube and cap barcode for storing a culture collection in 2ml vials.

Printer: Zebra GK420t
Labels: LabTag #FJT-183 tube + cap labels

Notes:
- Used ZebraDesigner to design the label, printed to a .prn file
- Deleted header line from .prn file to get a clean ZPL formatted file
- Used an R-script to sub out the relevant barcode values for new ones
- Appended each new barcode to a long ZPL file (could be more efficient)

Things to do:
- Save template on printer and use ZPL fields to fill out information
- Read in CSV files with more complex label information (e.g. multiple text fields)
- Write log files to keep track of used barcodes and auto-increment based on log

