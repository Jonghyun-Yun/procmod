library(diprom)
## library(dplyr)
## library(stringr)
## library(msm)
## library(foreach)
## library(doParallel)
stopImplicitCluster()
registerDoParallel(cores = detectCores() - 1)
## doParallel::registerDoParallel(2)

setwd('~/workspace/procmod-code/')
piacc_orig_path = "./data/PIAAC_cleaned_data_1110/Problem_solving/Problem-solving_cleaned_1110.rdata"
piacc_path = "./data/PIAAC_cleaned_data_1110/Problem_solving/Problem-solving_no_missing.rdata"
## piacc_na.omit()
piacc_background_path = "./data/PIAAC_cleaned_data_1110/Prgusap1_2017.csv"
piacc_background_spss = "./data/PIAAC_cleaned_data_1110/Prgusap1_2017.sav"
## xxx = foreign::read.spss("./data/PIAAC_cleaned_data_1110/Prgusap1_2017.sav")

item = read_piacc(piacc_path, item_code, sub_str, ignore_str)
item2sen(item)
item %>% group_by(SEQID) %>% summarise(mnum = max(event_num))

system(". activate tf; python piacc_word2vec.py")

metadata_path = "input/metadata.tsv"
vectors_path = "input/vectors.tsv"
metadata = readr::read_tsv(metadata_path, col_names = FALSE)
vectors = readr::read_tsv(vectors_path, col_names = FALSE)

item = filter_item(item)
Q = get_trans(item)
Dml = get_cosdist()

dat = item2long(item)

M = length(state)
N = length(unique(dat$id))
dq = nrow(Q)
dn = nrow(dat)
dc = ncol(dat)

write_data()
source("R/init.R")
write_loop_index()
