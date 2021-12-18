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

ldir = ldir[2]

for (out_dir in ldir) {
flpa_path = paste0(out_dir, "lpa_mods.txt")
  if (file.exists(flpa_path)) {
    ##Delete file if it exists
    file.remove(flpa_path)
  }

source("R/pmean.R")
source("R/pinfo_preproc.R")

gg <- item %>%
  group_by(SEQID) %>%
  summarize(ftime = timestamp[1] / 1000, naction = n(), time = timestamp[n()] / 1000, spd = naction / (ftime - time))

ainfo = plyr::join(minfo, gg)
ainfo = ainfo %>% mutate(ltau = log(tau), laction = log(naction))

mod1 = ainfo %>%
  select(tau, theta) %>%
  single_imputation() %>%
  scale() %>%
  estimate_profiles(1:4,
                    variances = c( "varying"),
                    covariances = c( "varying")) %>%
  compare_solutions(statistics = c("AIC","AWE", "BIC", "CLC", "KIC"))

mod2 = ainfo %>%
  select(tau, theta, naction, spd) %>%
  single_imputation() %>%
  scale() %>%
  estimate_profiles(1:4,
                    variances = c( "varying"),
                    covariances = c( "varying")) %>%
  compare_solutions(statistics = c("AIC","AWE", "BIC", "CLC", "KIC"))

mod3 = ainfo %>%
  select(naction, spd) %>%
  single_imputation() %>%
  scale() %>%
  estimate_profiles(1:4,
                    variances = c( "varying"),
                    covariances = c( "varying")) %>%
  compare_solutions(statistics = c("AIC","AWE", "BIC", "CLC", "KIC"))

sink(flpa_path)
cat("\n--------------------------------------------------------------\n")
cat("tau and theta")
cat("\n--------------------------------------------------------------\n")
print(mod1)
cat("\n--------------------------------------------------------------\n")
cat("tau and theta + naction, spd")
cat("\n--------------------------------------------------------------\n")
print(mod2)
cat("\n--------------------------------------------------------------\n")
cat("naction, spd")
cat("\n--------------------------------------------------------------\n")
print(mod3)
sink()
}
## mod1 = ainfo %>%
##   select(ltau, theta) %>%
##   single_imputation() %>%
##   estimate_profiles(3, variances = "varying", covariances = "varying")

## mod2 = ainfo %>%
##   select(ltau, theta, laction, spd) %>%
##   single_imputation() %>%
##   estimate_profiles(2, variances = c("varying"), covariances = c("zero"))

## mod3 = ainfo %>%
##   select(laction, spd) %>%
##   single_imputation() %>%
##   estimate_profiles(2, variances = "varying", covariances = "varying")
