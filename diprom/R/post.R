set_cnames = function(M = M_, N = N_, dq = dq_, dn = dn_, dc = dc_) {
  cnames <- c(".chain", ".iteration")

  ## CSVFormat prints by row-major order!
  for (m in 1:M) {
    cnames <- c(cnames, paste0("kappa.", m))
  }
  for (m in 1:N) {
    cnames <- c(cnames, paste0("tau.", m))
  }
  for (k in 1:N) {
    cnames <- c(cnames, paste0("theta.", k))
  }
  cnames <- c(cnames, "sigma", "beta", "mu_beta", "sigma_beta", "llike_", "lpri_", "lp_")
  return(cnames)
}

get_nchain = function(out_dir) {
  ## use all sample files if nchain is not set
  ## assign if NULL
  if (is.null(num_chain)) {
    num_chain <- length(list.files(path = out_dir, pattern="sample_chain[0-9]+\\.csv"))
  }
  return(num_chain)
}

read_output = function(num_chain, cnames) {
  dlist <- list()
  for (cid in 1:num_chain) {
    dlist[[cid]] <- readr::read_csv(paste0(out_dir, "sample_chain", cid, ".csv"), col_names = F, skip = 0) %>% as.data.frame()
    colnames(dlist[[cid]]) <- cnames
  }
  return(dlist)
}

plot_intervals = function(param, trans_ = "log", save_plot = TRUE){
  regexp = paste0("^",param,"\\.")
  if (save_plot) pdf(paste0("figure/",param,"_mcmc_intervals.pdf"))
  p0 <- bayesplot::mcmc_intervals(
    mclist,
    regex_pars = regexp,
    transformations = trans_
  )
  ## mcmc_areas(
  ##  lambda0.sam,
  ##  prob = 0.8, # 80% intervals
  ##  prob_outer = 0.99, # 99%
  ##  point_est = "mean"
  ## )
  print(p0)
  if (save_plot) dev.off(which = dev.cur())
}

plot_parcoord = function(param, trans_ = "log", save_plot = TRUE){
  regexp = paste0("^",param,"\\.")
  if (save_plot) pdf(paste0("figure/",param,"_mcmc_parcoord.pdf"))
  p0 <- bayesplot::mcmc_parcoord(
    mclist,
    regex_pars = regexp,
    transformations = trans_
  )
  ## mcmc_areas(
  ##  lambda0.sam,
  ##  prob = 0.8, # 80% intervals
  ##  prob_outer = 0.99, # 99%
  ##  point_est = "mean"
  ## )
  print(p0)
  if (save_plot) dev.off(which = dev.cur())
}

plot_trace = function(param, max_, trans_ = "log", save_plot = TRUE){
  if (save_plot) pdf(paste0("figure/",param,"_mcmc_trace.pdf"))
    regexp = paste0("^",param,"\\.[0-9]$")
  for (ii in 0:floor(max_/10)) {
 if (ii > 0) regexp = paste0("^",param,"\\.", ii, "[0-9]$")
  p <- bayesplot::mcmc_trace(
    mclist,
    regex_pars = regexp,
    transformations = trans_,
    facet_args = list(nrow = 4, labeller = label_parsed)
  )
  print(p <- p + bayesplot::facet_text(size = 10))
  ## mcmc_areas(
  ##  lambda0.sam,
  ##  prob = 0.8, # 80% intervals
  ##  prob_outer = 0.99, # 99%
  ##  point_est = "mean"
  ## )
 }
  if (save_plot) dev.off(which = dev.cur())
  }
