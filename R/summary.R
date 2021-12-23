source("R/pmean.R")
var = jyunr::read_csv("./data/PIAAC_cleaned_data_1110/PUF_Variables.csv")
var = var %>% filter(Domain %in% c("Sampling / weighting", "Not assigned" ,"Sampling / weighting (derived)", "Background questionnaire (trend)"  ,"Background questionnaire", "Background questionnaire (derived)"))
param = data.frame(SEQID = unique(item$SEQID), theta = mtheta$mean, tau = mtau$mean)
pinfo = jyunr::read_csv("./data/PIAAC_cleaned_data_1110/PUFs_spss.csv")
pinfo = pinfo %>% select(SEQID) %>% cbind(pinfo[,names(pinfo) %in% toupper(var$Name)])
minfo = plyr::join(param, pinfo, by = 'SEQID', type = "inner")
dx = minfo[,4:ncol(minfo)]

## dat <- readr::read_csv(paste0(out_dir, "input/dat.csv"), col_names = FALSE)
## rr <- dat[, c(1, 8)] %>% as.data.frame()
## rr <- rr[!duplicated(rr), 2]
gg <- item %>%
  group_by(SEQID) %>%
  summarize(ftime = timestamp[1] / 1000, naction = n(),
            time = timestamp[n()] / 1000, spd = naction / time)
## binfo = readr::read_csv("./data/PIAAC_cleaned_data_1110/PUFs_noN.csv")

## book_order =minfo= has a fewer SEQID than =item=
gres <- item %>%
  group_by(SEQID) %>%
  summarize(res = response[n()], time = timestamp[n()] / 1000) %>% mutate(index = 1:n())
ginfo = plyr::join(minfo, gres)
rr = ginfo$res

pdf("figure/tau_action.pdf")
pp <- cl_plot(cbind(log(mtau), log(gg$naction)), rr, c("log(tau)", "log(#action)"))
print(pp)
dev.off(which = dev.cur())

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
pp <- cl_plot(cbind(mtheta, log(mtau)), rr, c("theta", "log(tau)"))
print(pp)
dev.off(which = dev.cur())

pdf("figure/time_action_more.pdf")
cl_box(log(gg$time), rr, c("log(time)", "res"))
cl_box(log(gg$ftime / gg$time), rr, c("log(ftime / time)", "res"))
cl_box(log(gg$time - gg$ftime), rr, c("log(time - ftime)", "res"))
cl_box(log(gg$naction / gg$time), rr, c("log(#action / time)", "res"))
pp <- cl_plot(cbind(log(gg$time), log(gg$naction)), rr, c("log(time)", "log(#actions)"))
print(pp)
pp <- cl_plot(cbind(log(gg$time), log(gg$ftime)), rr, c("log(time)", "log(ftime)"))
print(pp)
pp <- cl_plot(cbind(mtheta, log(gg$time)), rr, c("theta", "log(time)"))
print(pp)
pp <- cl_plot(cbind(mtheta, log(gg$time - gg$ftime)), rr, c("theta", "log(time - ftime)"))
print(pp)
pp <- cl_plot(cbind(mtheta, log(gg$naction / gg$time)), rr, c("theta", "log(#action / time)"))
print(pp)
pp <- cl_plot(cbind(mtheta, log(gg$naction / (gg$time - gg$ftime))), rr, c("theta", "log(#action / (time - ftime))"))
print(pp)
pp <- cl_plot(cbind(mtau, log(gg$time)), rr, c("tau", "log(time)"))
print(pp)
pp <- cl_plot(cbind(mtau, log(gg$time - gg$ftime)), rr, c("tau", "log(time - ftime)"))
print(pp)
pp <- cl_plot(cbind(mtau, log(gg$naction / gg$time)), rr, c("tau", "log(#action / time)"))
print(pp)
pp <- cl_plot(cbind(mtau, log(gg$naction / (gg$time - gg$ftime))), rr, c("tau", "log(#action / (time - ftime))"))
print(pp)
dev.off(which = dev.cur())

pdf("figure/time_action.pdf")
cl_box(log(gg$ftime), rr, c("log(first_action_time)", "res"))
cl_box(log(gg$naction), rr, c("log(naction)", "res"))
pp <- cl_plot(cbind(mtheta, log(gg$ftime)), rr, c("theta", "log(first_action_time)"))
print(pp)
pp <- cl_plot(cbind(mtheta, log(gg$naction)), rr, c("theta", "log(#actions)"))
print(pp)
pp <- cl_plot(cbind(mtau, log(gg$ftime)), rr, c("tau", "log(first_action_time)"))
print(pp)
pp <- cl_plot(cbind(mtau, log(gg$naction)), rr, c("tau", "log(#actions)"))
print(pp)
pp <- cl_plot(cbind(log(gg$ftime), log(gg$naction)), rr, c("log(first_action_time)", "log(#action)"))
print(pp)
dev.off(which = dev.cur())
