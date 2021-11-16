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

nc2 = c(4,4,3)
nc3 = c(2,3,2)
kk = 0
for (out_dir in ldir) {
  kk = kk + 1
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

source("R/lpa_back.R")
print(classplot + ylim(-5, 5))
ggsave(file=paste0(out_dir,"figure/lpa_back_line.pdf"),width=16,height=9)
}
