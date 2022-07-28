library(diprom)
library(jyunr)
library(tidyLPA)

ldir = c(
"party_invitations-1/",
"party_invitations-2/",
"cd_tally/",
"sprained_ankle-1/",
## "sprained_ankle-2/", ## didn't run
"tickets/",
## "class_attendance/", ## didn't run
"club_membership-1/",
## "club_membership-2/", ## didn't run
"book_order/",
"meeting_room/",
## "reply_all/", ## failed
"locate_email/",
"lamp_return/"
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

item_code_book = c(
"U01a000S",
"U01b000S",
"U03a000S",
"U06a000S",
"U21x000S",
"U19a000S",
"U07x000S",
"U02x000S",
"U11b000S",
"U23x000S")

## ## Party Invitations - 1;
## item_code = "U01a000S"
## ## Party Invitations - 2;
## item_code = "U01b000S"
## ## CD Tally;
## item_code = "U03a000S"
## ## Sprained Ankle - 1;
## item_code = "U06a000S"
## ## Tickets;
## item_code = "U21x000S"
## ## Club Membership - 1;
## item_code = "U19a000S"
## ## Book Order;
## item_code = "U07x000S"
## ## Meeting Room;
## item_code = "U02x000S"
## ## Locate Email;
## item_code = "U11b000S"
## ## Lamp Return;
## item_code = "U23x000S"

for (out_dir in ldir) {
## out_dir = ldir[1]

kk = which(out_dir == ldir)
item_code = item_code_book[kk]

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

load(paste0(out_dir, "lpa_membership_mod3.RData"))
item = read_piacc(piacc_path, item_code, sub_str, ignore_str)

mc = max(memb$Class)
for (cc in 1:mc) {
item2sen(item, memb$SEQID[memb$Class == cc])

## system("conda activate tf; python py/collocation.py")
## library(reticulate)
## conda_python("tf")
## source_python("py/collocation.py")
## library(reticulate)
reticulate::use_condaenv("tf")
## reticulate::use_python()
reticulate::source_python("py/collocation.py")

file.rename("input/bi_ss.tsv", paste0("input/mod3_bi_ss_class_", cc,".tsv"))
file.rename("input/tri_ss.tsv", paste0("input/mod3_tri_ss_class_", cc,".tsv"))
file.rename("input/quad_ss.tsv", paste0("input/quad_ss_class_", cc,".tsv"))
    }
system(paste0("mv input/*.tsv ", out_dir))
  }
