param_path = paste0(out_dir, "param_mean.csv")
if (file.exists(param_path)) {
  dout = readr::read_csv(param_path)
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
dat <- readr::read_csv(paste0(out_dir, "input/dat.csv"), col_names = FALSE)
rr <- dat[, c(1, 8)] %>% as.data.frame()
rr <- rr[!duplicated(rr), 2]

item <- readr::read_csv(paste0(out_dir, "input/item.csv"), col_names = TRUE)
gg <- item %>%
  group_by(pid) %>%
  summarize(ftime = timestamp[1] / 1000, naction = n(), spd = naction / ftime, time = timestamp[n()] / 1000)
binfo = readr::read_csv("./data/PIAAC_cleaned_data_1110/PUFs_noN.csv")

pdf("figure/tau_action.png")
pp <- cl_plot(cbind(log(mtau), log(gg$naction), rr, c("log(tau)", "log(#action)"))
print(pp)
dev.off(which = dev.cur())
