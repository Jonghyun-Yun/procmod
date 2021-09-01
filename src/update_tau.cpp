#include "update_tau.h"

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
                  boost::ecuyer1988 &rng) {

  // log-acceptance ratio
  // double logr_tau = 0.0;
  // double tau_s;

  double post_a = a_tau + 1.0;
  double post_b = b_tau;

  // std::cout << "Drawing...\n";
  // tau_s = stan::math::normal_rng(tau, jump_tau, rng);

  // prior and jump rule
  // logr_tau += stan::math::gamma_lpdf(tau_s, a_tau, b_tau) -
                // stan::math::gamma_lpdf(tau, a_tau, b_tau);

  // std::cout << "Calculating the log-acceptance ratio of lambda...\n";
  for (auto &ii : person_k) {
  // std::cout << "ii: " << ii << "\n";
  // std::cout << "status: " << status.at(ii) << "\n";
  // std::cout << "from: " << acfrom.at(ii) << "\n";
  // std::cout << "kappa: " << kappa(acfrom.at(ii)) << "\n";

  if (status.at(ii) == 1)
    post_a += 1.0;
  post_b +=
      tdiff(ii) * kappa(acfrom.at(ii)) * std::exp((theta_k + beta) * dist(ii));
  }
  tau = stan::math::gamma_rng(post_a, post_b, rng);
}
