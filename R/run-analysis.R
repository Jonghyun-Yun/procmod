#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)
# test if there is at least one argument: if not, return an error

if (length(args) < 1) {
  stop("out_dir must be supplied.\n", call. = FALSE)
} else out_dir <- args[1]

if (length(args) == 2) {
num_chain <- args[2]
  } else if (length(args) == 1) {
num_chain = NULL
num_chain = get_nchain(out_dir)
  }
## out_dir <- "chessB-singleZ-singleW/"
system(paste0("rm figure/*.pdf"))
source("R/analysis.R")
system(paste0("mkdir -p ", out_dir, "figure/"))
system(paste0("rsync -rv figure/*.pdf ", out_dir, "figure/"))
