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
print(boxp)
dev.off(which = dev.cur())

pdf("figure/theta_tau_res.pdf")
pp = cl_plot(cbind(mtheta, log(mtau)), rr, c("theta","log(tau)"))
print(pp)
dev.off(which = dev.cur())

item <- readr::read_csv(paste0(out_dir, "input/item.csv"), col_names = TRUE)
gg = item %>% group_by(pid) %>% summarize(ftime = timestamp[1] / 1000, naction = n(), spd = naction / ftime, time = timestamp[n()] / 1000)

pdf("figure/time_action_more.pdf")
cl_box(log(gg$time), rr, c("log(time)", "res"))
cl_box(log(gg$ftime / gg$time), rr, c("log(ftime / time)", "res"))
cl_box(log(gg$ftime - gg$time), rr, c("log(ftime - time)", "res"))
cl_box(log(gg$naction / gg$time), rr, c("log(#action / time)", "res"))
pp = cl_plot(cbind(log(gg$time), log(gg$naction)), rr, c("log(time)","log(#actions)"))
print(pp)
pp = cl_plot(cbind(log(gg$time), log(gg$ftime)), rr, c("log(time)","log(ftime)"))
print(pp)
pp = cl_plot(cbind(mtheta, log(gg$time)), rr, c("theta","log(time)"))
print(pp)
pp = cl_plot(cbind(mtau, log(gg$time)), rr, c("tau","log(time)"))
print(pp)
pp = cl_plot(cbind(mtheta, log(gg$naction / gg$time)), rr, c("theta","log(#action / time)"))
print(pp)
pp = cl_plot(cbind(mtheta, log(gg$naction / (gg$time - gg$ftime))), rr, c("theta","log(#action / (time - ftime))"))
print(pp)
pp = cl_plot(cbind(mtau, log(gg$naction / gg$time)), rr, c("tau","log(#action / time)"))
print(pp)
pp = cl_plot(cbind(mtheta, log(gg$ftime / gg$time)), rr, c("theta","log(#action / time)"))
print(pp)
pp = cl_plot(cbind(mtau, log(gg$ftime / gg$time)), rr, c("tau","log(#action / time)"))
print(pp)
dev.off(which = dev.cur())

pdf("figure/time_action.pdf")
cl_box(log(gg$ftime), rr, c("log(first_action_time)", "res"))
cl_box(log(gg$naction), rr, c("log(naction)", "res"))
pp = cl_plot(cbind(mtheta, log(gg$ftime)), rr, c("theta","log(first_action_time)"))
print(pp)
pp = cl_plot(cbind(mtheta, log(gg$naction)), rr, c("theta","log(#actions)"))
print(pp)
pp = cl_plot(cbind(mtau, log(gg$ftime)), rr, c("tau","log(first_action_time)"))
print(pp)
pp = cl_plot(cbind(mtau, log(gg$naction)), rr, c("tau","log(#actions)"))
print(pp)
pp = cl_plot(cbind(log(gg$ftime), log(gg$naction)), rr, c("log(first_action_time)","log(#action)"))
print(pp)
dev.off(which = dev.cur())
