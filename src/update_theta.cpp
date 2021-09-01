#include "update_theta.h"

void update_theta(double &theta, double &acc_theta, const double &mu_theta,
                  const double &jump_theta,
                  const double sigma,
                  const Eigen::VectorXd &kappa,
                  const double tau_k, const double beta,
                  const std::vector<int> &person_k, const std::vector<int> &sid,
                  const std::vector<int> &acfrom, const Eigen::VectorXd &tdiff,
                  const std::vector<int> &status, const Eigen::VectorXd &dist,
                  boost::ecuyer1988 &rng) {

  // log-acceptance ratio
  double logr_theta = 0.0;
  double theta_s;
  // double cum_lambda;

  // std::cout << "Drawing...\n";
  theta_s = stan::math::normal_rng(theta, jump_theta, rng);

  // prior and jump rule
  logr_theta += stan::math::normal_lpdf(theta_s, mu_theta, sigma) -
                stan::math::normal_lpdf(theta, mu_theta, sigma);

  // std::cout << "Calculating the log-acceptance ratio of lambda...\n";
  for (auto &ii : person_k) {
    if (status.at(ii) == 1)
      logr_theta += (theta_s - theta) * dist(ii);
    logr_theta -= tdiff(ii) * kappa(acfrom.at(ii)) * tau_k *
                  (std::exp((theta_s + beta) * dist(ii)) -
                   std::exp((theta + beta) * dist(ii)));
  }

  // accept or reject?
  if ((logr_theta > 0.0) ||
      (logr_theta > std::log(stan::math::uniform_rng(0.0, 1.0, rng)))) {
    theta = theta_s;
    acc_theta += 1.0;
  }
}
