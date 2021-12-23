param_path = paste0(out_dir, "param_mean.csv")
if (file.exists(param_path)) {
  dout = jyunr::read_csv(param_path)
} else {
  ss <- summary(mclist)
  mm <- ss$statistics[, "Mean"]
  ## rr <- c(grep("^kappa", names(mm)), grep("^tau", names(mm)))
  ## dout <- data.frame(vname = names(mm[rr]), mean = mm[rr])
  dout <- data.frame(vname = names(mm), mean = mm)
  readr::write_csv(dout, param_path)
}
mtheta <- dout[grep("^theta", dout$vname), 2]
mtau <- dout[grep("^tau", dout$vname), 2]
mkappa <- dout[grep("^kappa", dout$vname), 2]

item <- jyunr::read_csv(paste0(out_dir, "input/item.csv"), col_names = TRUE)
