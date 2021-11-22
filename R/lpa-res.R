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

nc2 = c(4,4,3)
nc3 = c(2,3,2)

kk = which(out_dir == ldir)

lname = list(paste0(out_dir,"tau_imp.txt"), paste0(out_dir,"theta_imp.txt"))

source("R/pmean.R")
source("R/pinfo_preproc.R")

res = list(tau = minfo$tau, theta = minfo$theta)

gg <- item %>%
  group_by(SEQID) %>%
  summarize(ftime = timestamp[1] / 1000, naction = n(), time = timestamp[n()] / 1000, spd = naction / (ftime - time))

ainfo = plyr::join(minfo, gg)
ainfo = ainfo %>% mutate(ltau = log(tau), laction = log(naction))

mod2 = ainfo %>%
  select(tau, theta, naction, spd) %>%
  single_imputation() %>%
  scale() %>%
  estimate_profiles(nc2[kk],
                    variances = c( "varying"),
                    covariances = c( "varying"))

mod3 = ainfo %>%
  select(naction, spd) %>%
  single_imputation() %>%
  scale() %>%
  estimate_profiles(nc3[kk],
                    variances = c( "varying"),
                    covariances = c( "varying"))

pdf(paste0(out_dir,"figure/lpa_plot.pdf"))
mod2 %>% plot_profiles()
mod3 %>% plot_profiles()
dev.off()

source("R/pmean.R")
dat <- readr::read_csv(paste0(out_dir, "input/dat.csv"), col_names = FALSE)
rr <- dat[, c(1, 8)] %>% as.data.frame()
rr <- rr[!duplicated(rr), 2]
gg <- item %>%
  group_by(pid) %>%
  summarize(ftime = timestamp[1] / 1000, naction = n(), spd = naction / ftime, time = timestamp[n()] / 1000)
## binfo = readr::read_csv("./data/PIAAC_cleaned_data_1110/PUFs_noN.csv")
df = mod2[[1]]
before = df[["dff"]][,1:6]
after = df[["dff"]][,-c(1:6)]
df[["dff"]] = before %>% mutate(res = rr) %>% cbind(after)

tt = df[["dff"]]
mm = aggregate(tt, list(tt$Class), FUN=mean)
sd = aggregate(tt, list(tt$Class), FUN=sd)
n = aggregate(tt, list(tt$Class), FUN=length)
se = sd / sqrt(n)

save(mm,sd,n, file = paste0(out_dir, "summaryw_res.RData"))
mm %>% select(4:8) %>% knitr::kable()
sd %>% select(4:8) %>% knitr::kable()
n %>% select(4:8) %>% knitr::kable()
