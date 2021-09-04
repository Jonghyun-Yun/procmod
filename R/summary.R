ss <- summary(mclist)
mm <- ss$statistics[, "Mean"]
## rr <- c(grep("^kappa", names(mm)), grep("^tau", names(mm)))
## dout <- data.frame(vname = names(mm[rr]), mean = mm[rr])
dout <- data.frame(vname = names(mm), mean = mm)

readr::write_csv(dout, paste0(out_dir, "param_mean.csv"))

mtheta <- dout[grep("^theta", dout$vname), 2]
mtau <- dout[grep("^tau", dout$vname), 2]
mkappa <- dout[grep("^kappa", dout$vname), 2]
dat <- readr::read_csv(paste0(out_dir,"input/dat.csv"), col_names = FALSE)
rr <- dat[, c(1, 8)] %>% as.data.frame()
rr <- rr[!duplicated(rr), 2]

pdf("figure/theta_res.pdf")
dd <- data.frame(theta = mtheta, res = rr)
boxp <- ggplot(dd, aes(x = factor(res), y = theta, fill = factor(res))) +
  geom_boxplot() +
  theme(legend.position = "none")
print(boxp)
dev.off(which = dev.cur())

pdf("figure/tau_res.pdf")
dd <- data.frame(tau = mtau, res = rr)
boxp <- ggplot(dd, aes(x = factor(res), y = tau, fill = factor(res))) +
  geom_boxplot() +
  theme(legend.position = "none")
boxp
dev.off(which = dev.cur())

pdf("figure/theta_tau_res.pdf")
pp = cl_plot(cbind(mtheta, log(mtau)), rr, c("theta","log(tau)"))
print(pp)
dev.off(which = dev.cur())
