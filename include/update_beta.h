#ifndef __UPDATE_BETA_H_
#define __UPDATE_BETA_H_

#include <stan/math.hpp>

void update_beta(double &beta, double &acc_beta, const double &mu_beta,
                 const double &sigma_beta, const double &jump_beta,
                 const double sigma,
                 const Eigen::VectorXd &kappa, const Eigen::VectorXd &tau,
                 const Eigen::VectorXd &theta, const std::vector<int> &sid,
                 const std::vector<int> &acfrom, const Eigen::VectorXd &tdiff,
                 const std::vector<int> &status, const Eigen::VectorXd &dist,
                 const int dn, boost::ecuyer1988 &rng, bool RUN_PAR);

#endif // __UPDATE_BETA_H_
