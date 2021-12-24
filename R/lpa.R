flpa_path = paste0(out_dir, "lpa_mods.txt")
  if (file.exists(flpa_path)) {
    ##Delete file if it exists
    file.remove(flpa_path)
  }

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
