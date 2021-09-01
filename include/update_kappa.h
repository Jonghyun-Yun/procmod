#ifndef __UPDATE_KAPPA_H_
#define __UPDATE_KAPPA_H_

#include <stan/math.hpp>

void update_kappa(double &kappa, double &acc_kappa, const double &a_kappa,
                  const double &b_kappa,
                  const double &jump_kappa, const double &sigma,
                  const Eigen::VectorXd &tau, const Eigen::VectorXd &theta,
                  const double beta,
                  const std::vector<int> &oos_m,
                  const std::vector<int> &sid,
                  const Eigen::VectorXd &tdiff,
                  const std::vector<int> &status,
                  const Eigen::VectorXd &dist,
                  boost::ecuyer1988 &rng);

#endif // __UPDATE_KAPPA_H_
