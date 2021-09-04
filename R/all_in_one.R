item_code = "U03a000S"
source("R/itemcode.R")
out_dir = paste0(booklet$NAME[booklet$CODEBOOK == item_code], "/")
source("R/preproc-data.R")
system(paste0("sh run.sh ", out_dir))

item_code = "U21x000S"
source("R/itemcode.R")
out_dir = paste0(booklet$NAME[booklet$CODEBOOK == item_code], "/")
source("R/preproc-data.R")
system(paste0("sh run.sh ", out_dir))
