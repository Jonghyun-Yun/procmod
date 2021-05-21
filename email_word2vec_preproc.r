library(dplyr)
library(stringr)
setwd('~/workspace/procmod-code/')
load('./data/PIAAC_cleaned_data_1110/Problem_solving/Problem-solving_no_missing.rdata')
email = PS %>% filter(CODEBOOK == "U01a000S")

## core_event = c("MAIL_DRAG", "MAIL_MOVED")
core_event = c("MAIL_DRAG", "MAIL_MOVED", "MAIL_VIEWED")
## core_event = c("MAIL_MOVED")
email$event_description[!(email$event_type %in% core_event)] <- ""
## email$event_description <- ""

timestamp = email$timestamp
diff = c(diff(timestamp), 99999)
email$diff = diff
email = email[(diff > 99) || (diff < 0 ), ]

email$event_description = stringr::str_replace(email$event_description, "(.*)\\*\\$target=u01a_(.*)",  "\\1\\2")
email$event_description = stringr::str_replace(email$event_description, "id=u01a_",  "")
email$event_description = stringr::str_replace(email$event_description, "\\*\\$target=",  "")

email = email %>% mutate(event_description = ifelse(event_type == "START","",event_description)) %>%
mutate(event_description = ifelse(event_type == "END","",event_description)) %>%
  mutate(event_description = ifelse(event_type == "KEYPRESS","",event_description)) %>%
  mutate(event_concat = ifelse(event_description == "", event_type, paste0(event_type,"-",event_description))) %>%
mutate(word = gsub(" ", "_", event_concat))

ww = email$word
id = email$SEQID
ww0 = ww[1:(length(ww)-1)]
ww1 = ww[2:(length(ww))]

dup = ww0 == ww1
dup0 = c(dup,  FALSE )
dup1 = c( FALSE ,  dup)

idx = dup1

cw = "NULL"
cid = 9999999999
for (kk in which(dup1)) {
  if(cw != ww[kk] && cid != id[kk]) idx[kk] = FALSE
  cw = ww[kk]
  cid = id[kk]
}

email = email[!idx, ]

n = nrow(email)
pre = email$word[1:(n-1)]
cur = email$word[2:n]
dif = c(TRUE, !(cur == pre))

idx = logical(n)
for (i in 2:n) {
if(dif[i] == FALSE && dif[i-1] == FALSE) {
  idx[i] = TRUE
  }
}

email = email[!idx,]

id = unique(email$SEQID)
seqs = character(length(id))
for (i in id) {
  ## for (word in email$word[email$SEQID == i]) {
    ## seqs[i] = paste0(seqs[i], " ", word)
  ## }
  seqs[i] = paste(email$word[email$SEQID == i] , collapse = " ")
}

## for (i in id) {
##     seqs[i] = gsub("START ", "", seqs[i])
##     seqs[i] = gsub(" END", "", seqs[i])
## }
seqs = seqs[id]

data.table::fwrite(as.data.frame(seqs), "email_sentence.txt", col.names=F)
