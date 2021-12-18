library(diprom)
library(tidyLPA)

ldir = c(
"party_invitations-1/",
## "party_invitations-2/",
## "cd_tally/",
## "sprained_ankle-1/",
## "sprained_ankle-2/", ## didn't run
"tickets/",
## "class_attendance/", ## didn't run
## "club_membership-1/",
## "club_membership-2/", ## didn't run
"book_order/"
## "meeting_room/",
## "reply_all/", ## failed
## "locate_email/",
## "lamp_return/"
)

## out_dir="party_invitations-1/"
## out_dir="party_invitations-2/"
## out_dir="cd_tally/"
## out_dir="sprained_ankle-1/"
## out_dir="sprained_ankle-2/"
## out_dir="tickets/"
## out_dir="class_attendance/"
## out_dir="club_membership-1/"
## out_dir="club_membership-2/"
## out_dir="book_order/"
## out_dir="meeting_room/"
## out_dir="reply_all/"
## out_dir="locate_email/"
## out_dir="lamp_return/"

num_chain = 2
stopImplicitCluster()
## doParallel::registerDoParallel(2)
registerDoParallel(cores = detectCores() - 1)
out_dir = ldir[3]

item_code = "U01a000S" # party-1
## item_code = "U21x000S" # ticket
item_code = "U07x000S" # book order

source("R/itemcode.R")

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

load(paste0(out_dir, "lpa_membership.RData"))
item = read_piacc(piacc_path, item_code, sub_str, ignore_str)

mc = max(tmp$Class)
for (cc in 1:mc) {
item2sen(item, tmp$SEQID[tmp$Class == cc])
system(". activate tf; python collocation.py")
system(paste0("mv input/bi_ss.tsv input/bi_ss_class_", cc,".tsv"))
system(paste0("mv input/tri_ss.tsv input/tri_ss_class_", cc,".tsv"))
system(paste0("mv input/quad_ss.tsv input/quad_ss_class_", cc,".tsv"))
}
system(paste0("mv input/*.tsv ", out_dir))
