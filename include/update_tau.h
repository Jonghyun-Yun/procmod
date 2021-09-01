#ifndef __UPDATE_TAU_H_
#define __UPDATE_TAU_H_

#include <stan/math.hpp>

void update_tau(double &tau, double &acc_tau, const double &a_tau,
                  const double &b_tau,
                  const double &jump_tau, const double &sigma,
                  const Eigen::VectorXd &kappa, const double theta_k,
                  const double beta,
                  const std::vector<int> &person_k,
                  const std::vector<int> &sid,
                  const std::vector<int> &acfrom,
                  const Eigen::VectorXd &tdiff,
                  const std::vector<int> &status,
                  const Eigen::VectorXd &dist,
                  boost::ecuyer1988 &rng);

#endif // __UPDATE_TAU_H_
