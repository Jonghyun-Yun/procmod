#include "update_kappa.h"
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
                  boost::ecuyer1988 &rng) {

  // log-acceptance ratio
  // double logr_kappa = 0.0;
  // double kappa_s;

  double post_a = a_kappa + 1.0;
  double post_b = b_kappa;

  // std::cout << "Drawing...\n";
  // kappa_s = stan::math::normal_rng(kappa, jump_kappa, rng);

  // prior and jump rule
  // logr_kappa += stan::math::gamma_lpdf(kappa_s, a_kappa, b_kappa) -
                // stan::math::gamma_lpdf(kappa, a_kappa, b_kappa);

  // std::cout << "Calculating the log-acceptance ratio of lambda...\n";
  for (auto &ii : oos_m) {

  // std::cout << "ii: " << ii << "\n";
  // std::cout << "status: " <<status.at(ii) << "\n";
  // std::cout << "sid: " <<sid.at(ii) << "\n";
  // std::cout << "tau: " <<tau(sid.at(ii)) << "\n";

    if (status.at(ii)==1) post_a += 1.0;
    post_b += tdiff(ii) * tau(sid.at(ii)) * std::exp((theta(sid.at(ii)) + beta) * dist(ii));
  }
  kappa = stan::math::gamma_rng(post_a, post_b, rng);
}
