read_piacc = function(piacc_path, item_code, sub_str, ignore_str, core_event = NULL) {
  load(piacc_path)
  item = PS %>% filter(CODEBOOK == item_code)

## core_event = c("MAIL_DRAG", "MAIL_MOVED", "MAIL_VIEWED")
## email$event_description[!(email$event_type %in% core_event)] <- ""

  timestamp = item$timestamp
  diff = c(diff(timestamp), 99999)
  item$diff = diff
  item = item[(diff >= 10) || (diff < 0 ), ]

  if (length(sub_str) != 0) {
    for (ii in 1:nrow(sub_str)){
      item$event_description = stringr::str_replace_all(item$event_description,
                                                    sub_str[ii,1], sub_str[ii,2])}
  }

  if (length(ignore_desc) != 0) {
    for (ii in 1:length(ignore_desc)) {
      item = item %>% mutate(event_description = ifelse(event_type == ignore_desc[ii],"",event_description)) }
  }

  item = item %>%
    mutate(event_concat = ifelse(event_description == "", event_type, paste0(event_type,"-",event_description))) %>%
    mutate(word = gsub(" ", "_", event_concat))

  return(item)
}

item2sen = function(item) {
ww = item$word
id = item$SEQID
ww0 = ww[1:(length(ww)-1)]
ww1 = ww[2:(length(ww))]

dup = ww0 == ww1
dup0 = c(dup,  FALSE )
dup1 = c(FALSE ,  dup)

idx = dup1

cw = "NULL"
cid = 9999999999
for (kk in which(dup1)) {
  if(cw != ww[kk] && cid != id[kk]) idx[kk] = FALSE
  cw = ww[kk]
  cid = id[kk]
}

item = item[!idx, ]

n = nrow(item)
pre = item$word[1:(n-1)]
cur = item$word[2:n]
dif = c(TRUE, !(cur == pre))

idx = logical(n)
for (i in 2:n) {
if(dif[i] == FALSE && dif[i-1] == FALSE) {
  idx[i] = TRUE
  }
}

item = item[!idx,]

id = unique(item$SEQID)
seqs = character(length(id))
for (i in id) {
  ## for (word in item$word[item$SEQID == i]) {
    ## seqs[i] = paste0(seqs[i], " ", word)
  ## }
  seqs[i] = paste(item$word[item$SEQID == i] , collapse = " ")
}

## for (i in id) {
##     seqs[i] = gsub("START ", "", seqs[i])
##     seqs[i] = gsub(" END", "", seqs[i])
## }
seqs = seqs[id]

data.table::fwrite(as.data.frame(seqs), "input/item_sentence.txt", col.names=F)
}

filter_item = function(item) {
  ## a few more processing
  ## state to global env
item =  item %>% filter(word !="START")
state <<- unique(item$word)
ntate = numeric(nrow(item))
ii = 0
for (ww in item$word) {
  ii = ii + 1
  ntate[ii] = which(state == ww)
}
item$state = ntate

uid = unique(item$SEQID)
pid = numeric(nrow(item))
ii = 0
for (nn in item$SEQID) {
  ii = ii + 1
  pid[ii] = which(uid == nn)
  }
item$pid = pid
return(item)}

get_trans = function(item) {
id = unique(item$SEQID)
L = length(state <<- unique(item$word))
Q = matrix(0, L, L)
for (i in id) {
  ## for (word in item$word[item$SEQID == i]) {
    ## seqs[i] = paste0(seqs[i], " ", word)
  ## }
  seq = item$state[item$SEQID == i]
  for (k in 1:(length(seq)-1))
    Q[seq[k], seq[k+1]] = 1
  ## cat(seq[length(seq)-1])
}

rsq = rowSums(Q) > 0
diag(Q) = 1 * rsq

return(Q)}

write_data = function(){
## R to C index conversion
wat = dat
wat$id = wat$id - 1
wat$from = wat$from - 1
wat$to = wat$to - 1

## to be read from cpp
readr::write_csv(as.data.frame(item),"input/item.csv", col_names = TRUE)
readr::write_csv(as.data.frame(state),"input/state.csv", col_names = FALSE)
readr::write_csv(wat,"input/dat.csv", col_names = FALSE)
readr::write_csv(as.data.frame(Q),"input/trans.csv", col_names = FALSE)
readr::write_csv(as.data.frame(cbind(M, N, dq, dn, dc)),"input/mvar.csv", col_names = FALSE)
readr::write_csv(data.frame(Dml), "input/Dml.csv", col_names = FALSE)
}

write_init = function(params) {
## parameter init
readr::write_csv(as.data.frame(params$kappa),"input/init_kappa.csv", col_names = FALSE)
readr::write_csv(as.data.frame(params$tau),"input/init_tau.csv", col_names = FALSE)
readr::write_csv(as.data.frame(params$theta),"input/init_theta.csv", col_names = FALSE)
readr::write_csv(as.data.frame(params$sigma),"input/init_sigma.csv", col_names = FALSE)
readr::write_csv(as.data.frame(params$beta),"input/init_beta.csv", col_names = FALSE)
readr::write_csv(as.data.frame(params$mu_beta),"input/init_mu_beta.csv", col_names = FALSE)
readr::write_csv(as.data.frame(params$sigma_beta),"input/init_sigma_beta.csv", col_names = FALSE)
## hyper-parameter + jump
readr::write_csv(as.data.frame(cbind(params$a_kappa,params$b_kappa,params$jump_kappa)),"input/hyper_kappa.csv", col_names = FALSE)
readr::write_csv(as.data.frame(params$jump_beta),"input/hyper_beta.csv", col_names = FALSE)
readr::write_csv(as.data.frame(params$jump_theta),"input/hyper_theta.csv", col_names = FALSE)
readr::write_csv(as.data.frame(cbind(params$a_sigma,params$b_sigma)),"input/hyper_sigma.csv", col_names = FALSE)
readr::write_csv(as.data.frame(cbind(params$a_tau,params$b_tau,params$jump_tau)),"input/hyper_tau.csv", col_names = FALSE)
readr::write_csv(as.data.frame(cbind(params$a_sigma_beta,params$b_sigma_beta)),"input/hyper_sigma_beta.csv", col_names = FALSE)
readr::write_csv(as.data.frame(cbind(params$mu_mu_beta,params$sigma_mu_beta)),"input/hyper_mu_beta.csv", col_names = FALSE)
  }

write_loop_index = function() {
  fstr = NULL
  for (m in 1:M) {
    if(sum(dat$from==m)>0) {
      fstr = c(fstr, paste(which(dat$from == m) - 1, collapse = " ")) # R to C index conversion
    } else fstr = c(fstr, "-99")
  }
  fname = "input/out-of-state_index.txt"
  if (file.exists(fname)) {
    ##Delete file if it exists
    file.remove(fname)
  }
  fcon = file(fname)
  writeLines(fstr, fcon) # R to C index conversion
  close(fcon)

  fstr = NULL
  for (k in 1:max(item$pid)) {
    if(sum(dat$id==k)>0) {
      fstr = c(fstr, paste(which(dat$id == k) - 1, collapse = " ")) # R to C index conversion
    } else fstr = c(fstr, "-99")
}
fname = "input/person_index.txt"
if (file.exists(fname)) {
  ##Delete file if it exists
  file.remove(fname)
}
fcon = file(fname)
writeLines(fstr, fcon) # R to C index conversion
close(fcon)
}

write_loop_index_deprecated = function() {
sink("input/out-of-state_index.txt")
for (m in 1:M)
  if(sum(dat$from==m)>0) {
cat(which(dat$from == m) - 1,"\n") # R to C index conversion
  } else cat(-99,"\n")
sink()
sink("input/person_index.txt")
for (k in 1:max(item$pid))
  if(sum(dat$id==k)>0) {
cat(which(dat$id == k) - 1,"\n") # R to C index conversion
  } else cat(-99,"\n")
sink()
}
