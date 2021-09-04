diprom::plot_intervals("kappa")
diprom::plot_intervals("tau")
diprom::plot_intervals("theta", list())

bayesplot::color_scheme_set("mix-blue-pink")
diprom::plot_trace("kappa", M)
diprom::plot_trace("tau", N)
diprom::plot_trace("theta", 20, list())

pdf("figure/other_params_trace.pdf")
bayesplot::color_scheme_set("mix-blue-pink")
p <- bayesplot::mcmc_trace(mclist[[1]],
                           pars = c("sigma", "beta", "mu_beta", "sigma_beta", "llike_", "lpri_", "lp_"),
                           facet_args = list(nrow = 3, labeller = label_parsed)
                           )
print(p <- p + bayesplot::facet_text(size = 10))
dev.off(which = dev.cur())
