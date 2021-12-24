b
c

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

for (out_dir in ldir) {
  cathead(out_dir)
  ## nc2 = c(4,4,3)
  ## nc3 = c(2,3,2)
  
  ## cd_tally, book_order are winning for AIC and BIC
  ## "club_membership-1/": 3 3
  
  nc2 = c(4,4,4,4,4,3,4,4,4,4)
  nc3 = c(4,4,3,4,4,3,3,3,4,3)
  
  ## nc2 = c(4,4,4)
  ## nc3 = c(4,4,3)
  
  kk = which(out_dir == ldir)
  
  lname = list(paste0(out_dir,"tau_imp.txt"), paste0(out_dir,"theta_imp.txt"))
  
  source("R/pmean.R")
  var = jyunr::read_csv("./data/PIAAC_cleaned_data_1110/PUF_Variables.csv")
  var = var %>% filter(Domain %in% c("Sampling / weighting", "Not assigned" ,"Sampling / weighting (derived)", "Background questionnaire (trend)"  ,"Background questionnaire", "Background questionnaire (derived)"))
  param = data.frame(SEQID = unique(item$SEQID), theta = mtheta$mean, tau = mtau$mean)
  pinfo = jyunr::read_csv("./data/PIAAC_cleaned_data_1110/PUFs_spss.csv")
  pinfo = pinfo %>% select(SEQID) %>% cbind(pinfo[,names(pinfo) %in% toupper(var$Name)])
  minfo = plyr::join(param, pinfo, by = 'SEQID', type = "inner")
  dx = minfo[,4:ncol(minfo)]
  
  ## dat <- jyunr::read_csv(paste0(out_dir, "input/dat.csv"), col_names = FALSE)
  ## rr <- dat[, c(1, 8)] %>% as.data.frame()
  ## rr <- rr[!duplicated(rr), 2]
  gg <- item %>%
    group_by(SEQID) %>%
    summarize(ftime = timestamp[1] / 1000, naction = n(),
              time = timestamp[n()] / 1000, spd = naction / time)
  ## binfo = jyunr::read_csv("./data/PIAAC_cleaned_data_1110/PUFs_noN.csv")
  
  ## book_order =minfo= has a fewer SEQID than =item=
  gres <- item %>%
    group_by(SEQID) %>%
    summarize(res = response[n()], time = timestamp[n()] / 1000) %>% mutate(index = 1:n())
  ginfo = plyr::join(minfo, gres)
  rr = ginfo$res
  
  res = list(tau = minfo$tau, theta = minfo$theta)
  
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
  
  ## pdf(paste0(out_dir,"figure/lpa_plot.pdf"))
  ## mod2 %>% plot_profiles()
  ## mod3 %>% plot_profiles()
  ## dev.off()
  mod = mod2
  mod$name = "2"
  bf = ainfo %>% select(AGEG5LFS, ICTHOME, READHOME, WRITHOME, NUMHOME, NFEHRS, ICTWORK, READWORK, WRITWORK, NUMWORK, INFLUENCE, EARNHRDCL, TASKDISC, LEARNATWORK)
  bname = names(bf)
  var = jyunr::read_csv("./data/PIAAC_cleaned_data_1110/PUF_Variables.csv")
  var = var %>% filter(Domain %in% c("Sampling / weighting", "Not assigned" ,"Sampling / weighting (derived)", "Background questionnaire (trend)"  ,"Background questionnaire", "Background questionnaire (derived)"))
  param = data.frame(SEQID = unique(item$SEQID), theta = mtheta$mean, tau = mtau$mean)
  pinfo = jyunr::read_csv("./data/PIAAC_cleaned_data_1110/PUFs_spss.csv")
  pinfo = pinfo %>% select(SEQID) %>% cbind(pinfo[,names(pinfo) %in% toupper(var$Name)])
  minfo = plyr::join(param, pinfo, by = 'SEQID', type = "inner")
  dx = minfo[,4:ncol(minfo)]
  fname = "back_var.txt"
  toprint = var %>% filter(Name %in% bname) %>% select(Name, Label, 'Value scheme')
  kable2file(toprint, fname)
  bf[bf==999999999999] = NA ## back to NA
  bf = bf %>%
    single_imputation() %>%
    scale() %>% as.data.frame
  ftime = ainfo$ftime %>% scale()
  df = mod[[1]]
  before = df[["dff"]][,1:6]
  after = df[["dff"]][,-c(1:6)]
  df[["dff"]] = before %>% mutate(AGEG5LFS = bf$AGEG5LFS, ICTHOME = bf$ICTHOME, READHOME = bf$READHOME, WRITHOME = bf$WRITHOME, NUMHOME = bf$NUMHOME, NFEHRS = bf$NFEHRS, ICTWORK = bf$ICTWORK, READWORK = bf$READWORK, WRITWORK = bf$WRITWORK, NUMWORK = bf$NUMWORK, INFLUENCE = bf$INFLUENCE, EARNHRDCL = bf$EARNHRDCL, TASKDISC = bf$TASKDISC, LEARNATWORK = bf$LEARNATWORK) %>% cbind(after) %>% mutate(ftime)
  variables = c("tau", "theta", "naction", "spd", bname)
  
  tt = df[["dff"]]
  memb <- data.frame(tt,SEQID = ginfo$SEQID, index = ginfo$index, res = ginfo$res)
  save(memb, file = paste0(out_dir, "lpa_membership_mod",mod$name,".RData"))
  
  memb_tt = tt %>% mutate(res = ginfo$res)
  mm = aggregate(memb_tt, list(memb_tt$Class), FUN=mean)
  sd = aggregate(memb_tt, list(memb_tt$Class), FUN=sd)
  n = aggregate(memb_tt, list(memb_tt$Class), FUN=length)
  se = sd / sqrt(n)
  
  n = n[,4]
  mm = mm %>% select(4:7,res)
  sd = sd %>% select(4:7,res)
  mm$n = n;
  sd$n = 0*n;
  
  save(mm,sd,n, file = paste0(out_dir, "summaryw_res_mod",mod$name,".RData"))

  mod = mod3
  mod$name = "3"
  bf = ainfo %>% select(AGEG5LFS, ICTHOME, READHOME, WRITHOME, NUMHOME, NFEHRS, ICTWORK, READWORK, WRITWORK, NUMWORK, INFLUENCE, EARNHRDCL, TASKDISC, LEARNATWORK)
  bname = names(bf)
  var = jyunr::read_csv("./data/PIAAC_cleaned_data_1110/PUF_Variables.csv")
  var = var %>% filter(Domain %in% c("Sampling / weighting", "Not assigned" ,"Sampling / weighting (derived)", "Background questionnaire (trend)"  ,"Background questionnaire", "Background questionnaire (derived)"))
  param = data.frame(SEQID = unique(item$SEQID), theta = mtheta$mean, tau = mtau$mean)
  pinfo = jyunr::read_csv("./data/PIAAC_cleaned_data_1110/PUFs_spss.csv")
  pinfo = pinfo %>% select(SEQID) %>% cbind(pinfo[,names(pinfo) %in% toupper(var$Name)])
  minfo = plyr::join(param, pinfo, by = 'SEQID', type = "inner")
  dx = minfo[,4:ncol(minfo)]
  fname = "back_var.txt"
  toprint = var %>% filter(Name %in% bname) %>% select(Name, Label, 'Value scheme')
  kable2file(toprint, fname)
  bf[bf==999999999999] = NA ## back to NA
  bf = bf %>%
    single_imputation() %>%
    scale() %>% as.data.frame
  ftime = ainfo$ftime %>% scale()
  df = mod[[1]]
  before = df[["dff"]][,1:6]
  after = df[["dff"]][,-c(1:6)]
  df[["dff"]] = before %>% mutate(AGEG5LFS = bf$AGEG5LFS, ICTHOME = bf$ICTHOME, READHOME = bf$READHOME, WRITHOME = bf$WRITHOME, NUMHOME = bf$NUMHOME, NFEHRS = bf$NFEHRS, ICTWORK = bf$ICTWORK, READWORK = bf$READWORK, WRITWORK = bf$WRITWORK, NUMWORK = bf$NUMWORK, INFLUENCE = bf$INFLUENCE, EARNHRDCL = bf$EARNHRDCL, TASKDISC = bf$TASKDISC, LEARNATWORK = bf$LEARNATWORK) %>% cbind(after) %>% mutate(ftime)
  variables = c("tau", "theta", "naction", "spd", bname)
  
  tt = df[["dff"]]
  memb <- data.frame(tt,SEQID = ginfo$SEQID, index = ginfo$index, res = ginfo$res)
  save(memb, file = paste0(out_dir, "lpa_membership_mod",mod$name,".RData"))
  
  memb_tt = tt %>% mutate(res = ginfo$res)
  mm = aggregate(memb_tt, list(memb_tt$Class), FUN=mean)
  sd = aggregate(memb_tt, list(memb_tt$Class), FUN=sd)
  n = aggregate(memb_tt, list(memb_tt$Class), FUN=length)
  se = sd / sqrt(n)
  
  n = n[,4]
  mm = mm %>% select(4:7,res)
  sd = sd %>% select(4:7,res)
  mm$n = n;
  sd$n = 0*n;
  
  save(mm,sd,n, file = paste0(out_dir, "summaryw_res_mod",mod$name,".RData"))
}
