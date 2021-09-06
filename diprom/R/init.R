write_init = function() {
## parameter init
readr::write_csv(as.data.frame(kappa),"input/init_kappa.csv", col_names = FALSE)
readr::write_csv(as.data.frame(tau),"input/init_tau.csv", col_names = FALSE)
readr::write_csv(as.data.frame(theta),"input/init_theta.csv", col_names = FALSE)
readr::write_csv(as.data.frame(sigma),"input/init_sigma.csv", col_names = FALSE)
readr::write_csv(as.data.frame(beta),"input/init_beta.csv", col_names = FALSE)
readr::write_csv(as.data.frame(mu_beta),"input/init_mu_beta.csv", col_names = FALSE)
readr::write_csv(as.data.frame(sigma_beta),"input/init_sigma_beta.csv", col_names = FALSE)
## hyper-parameter + jump
readr::write_csv(as.data.frame(cbind(a_kappa,b_kappa,jump_kappa)),"input/hyper_kappa.csv", col_names = FALSE)
readr::write_csv(as.data.frame(jump_beta),"input/hyper_beta.csv", col_names = FALSE)
readr::write_csv(as.data.frame(jump_theta),"input/hyper_theta.csv", col_names = FALSE)
readr::write_csv(as.data.frame(cbind(a_sigma,b_sigma)),"input/hyper_sigma.csv", col_names = FALSE)
readr::write_csv(as.data.frame(cbind(a_tau,b_tau,jump_tau)),"input/hyper_tau.csv", col_names = FALSE)
readr::write_csv(as.data.frame(cbind(a_sigma_beta,b_sigma_beta)),"input/hyper_sigma_beta.csv", col_names = FALSE)
readr::write_csv(as.data.frame(cbind(mu_mu_beta,sigma_mu_beta)),"input/hyper_mu_beta.csv", col_names = FALSE)
  }
