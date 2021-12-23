var = jyunr::read_csv("./data/PIAAC_cleaned_data_1110/PUF_Variables.csv")
var = var %>% filter(Domain %in% c("Sampling / weighting", "Not assigned" ,"Sampling / weighting (derived)", "Background questionnaire (trend)"  ,"Background questionnaire", "Background questionnaire (derived)"))
param = data.frame(SEQID = unique(item$SEQID), theta = mtheta$mean, tau = mtau$mean)
pinfo = jyunr::read_csv("./data/PIAAC_cleaned_data_1110/PUFs_spss.csv")
pinfo = pinfo %>% select(SEQID) %>% cbind(pinfo[,names(pinfo) %in% toupper(var$Name)])
minfo = plyr::join(param, pinfo, by = 'SEQID', type = "inner")
dx = minfo[,4:ncol(minfo)]
