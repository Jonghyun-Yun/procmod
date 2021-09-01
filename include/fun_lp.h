#ifndef __FUN_LP_H_
#define __FUN_LP_H_

#include <stan/math.hpp>

// log like and prior, and then unnormalized log posteriror
double fun_lp(double &llike_, double &lpri_, const Eigen::VectorXd a_kappa,
              const Eigen::VectorXd b_kappa, const Eigen::VectorXd a_tau, const Eigen::VectorXd b_tau,
              const double mu_theta, const double sigma,
              const double mu_beta, const double sigma_beta,
              const double a_sigma, const double b_sigma,
              const double mu_mu_beta,
              const double sigma_mu_beta,
              const double a_sigma_beta,
              const double b_sigma_beta,
              const Eigen::VectorXd &kappa, const Eigen::VectorXd &tau,
              const Eigen::VectorXd &theta, const double beta,
              const std::vector<int> &sid, const std::vector<int> &acfrom,
              const Eigen::VectorXd &tdiff, const std::vector<int> &status,
              const Eigen::VectorXd &dist, const int dn);

#endif // __FUN_LP_H_
