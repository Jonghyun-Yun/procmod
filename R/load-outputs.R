mvar <- jyunr::read_csv(paste0(out_dir, "input/mvar.csv"), col_names = F) %>% as.matrix()
M = M_ = mvar[1]
N = N_ = mvar[2]
dq = dq_ = mvar[3]
dn = dn_ = mvar[4]
dc = dc_ = mvar[5]

cnames = diprom::set_cnames(M, N, dq, dn, dc)
dlist = diprom::read_output(num_chain, cnames)

## unlist
## df <- bind_rows(dlist, .id = "column_label")

mclist <- mcmc.list()
for (cid in 1:num_chain) {
  mclist[[cid]] <- mcmc(dlist[[cid]])
}
