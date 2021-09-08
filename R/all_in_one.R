ipath = "input"
if (dir.exists(paths)) {
  do.call(file.remove, list(list.files("input", full.names = TRUE)))
  } else dir.create(ipath)
source("R/itemcode.R")
out_dir = paste0(booklet$NAME[booklet$CODEBOOK == item_code], "/")
system(paste0("figlet ", item_code))
system(paste0("figlet ", out_dir))
source("R/preproc-data.R")
system(paste0("sh run.sh ", out_dir))
