#ifndef __UPDATE_THETA_H_
#define __UPDATE_THETA_H_

#include <stan/math.hpp>

void update_theta(double &theta, double &acc_theta, const double &mu_theta,
                  const double &jump_theta,
                  const double sigma,
                  const Eigen::VectorXd &kappa,
                  const double tau_k, const double beta,
                  const std::vector<int> &person_k, const std::vector<int> &sid,
                  const std::vector<int> &acfrom, const Eigen::VectorXd &tdiff,
                  const std::vector<int> &status, const Eigen::VectorXd &dist,
                  boost::ecuyer1988 &rng);

#endif // __UPDATE_THETA_H_
