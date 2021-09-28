binfo = readr::read_csv("./data/PIAAC_cleaned_data_1110/Prgusap1_2012.csv")
## binfo = foreign::read.spss("./data/PIAAC_cleaned_data_1110/Prgusap1_2012.sav")
item = readr::read_csv("input/item.csv")
pal = readr::read_csv("./data/PIAAC_cleaned_data_1110/PUFs_values.csv", col_types = readr::cols(.default = readr::col_character()))

pal[,1] = pal[,1] %>% unlist %>% toupper
vname = unique(pal[,1]) %>% unlist
bname = names(binfo)
SAS = pal[,3] %>% unlist %>% str_replace_all("\\.", "")
SPSS = pal[,4] %>% unlist

for (ii in 1:length(vname)) {
  if (any(vname[ii] == bname)) {
    binfo[,vname[ii]] = plyr::mapvalues(unlist(binfo[,vname[ii]]), SAS[pal[,1] == vname[ii]], SPSS[pal[,1] == vname[ii]])
    ## binfo[is.na(binfo[,vname[ii]]),vname[ii]] = "999999999999"
    binfo[,vname[ii]] = binfo[,vname[ii]] %>% mutate_if(is.character,as.factor) %>% mutate_if(is.factor, as.numeric)
    binfo[is.na(binfo[,vname[ii]]),vname[ii]] = 999999999999
}}
binfo = data.frame(SEQID = binfo$SEQID, binfo[, names(binfo) %in% vname])

binfo[is.na(binfo)] = 999999999999
readr::write_csv(binfo, "./data/PIAAC_cleaned_data_1110/PUFs_spss.csv")

for (ii in 6:ncol(binfo)) {
## binfo[,ii] = plyr::mapvalues(unlist(binfo[,ii]), "N", 9^50) %>% as.numeric
binfo[is.na(binfo[,ii]),ii] = -9^50
}
readr::write_csv(binfo, "./data/PIAAC_cleaned_data_1110/PUFs_noN.csv")
