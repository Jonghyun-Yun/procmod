init_val = list(
kappa = rep(0.1, M),
tau = rep(0.1, N),
theta = rep(0.1, N),
beta = 0,
sigma = 1,
mu_beta = 0,
sigma_beta = 1
)

## lambda
params = c(init_val, list(
a_kappa = matrix(0.1,M,1),
b_kappa = matrix(0.1,M,1),
jump_kappa = matrix(0.5,M,1),

jump_beta = matrix(0.1,1,1),

## mu_theta = matrix(0.0,N,1)
## sigma_theta = matrix(1.0,N,1)
jump_theta = matrix(1.0,N,1),

a_sigma = 1.0,
b_sigma = 1.0,

a_tau = matrix(0.1,N,1),
b_tau = matrix(0.1,N,1),
jump_tau = matrix(0.5,N,1),

a_sigma_beta = 1.0,
b_sigma_beta = 1.0,

mu_mu_beta = 0.0,
sigma_mu_beta = 10.0
))

write_init(params)
