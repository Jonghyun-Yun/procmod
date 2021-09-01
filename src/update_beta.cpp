#include "update_beta.h"

void update_beta(double &beta, double &acc_beta, const double &mu_beta,
                 const double &sigma_beta, const double &jump_beta,
                 const double sigma,
                 const Eigen::VectorXd &kappa, const Eigen::VectorXd &tau,
                 const Eigen::VectorXd &theta, const std::vector<int> &sid,
                 const std::vector<int> &acfrom, const Eigen::VectorXd &tdiff,
                 const std::vector<int> &status, const Eigen::VectorXd &dist,
                 const int dn, boost::ecuyer1988 &rng, bool RUN_PAR) {

  // log-acceptance ratio
  double logr_beta = 0.0;
  double beta_s;

  // std::cout << "Drawing...\n";
  beta_s = stan::math::normal_rng(beta, jump_beta, rng);

  // prior and jump rule
  logr_beta += stan::math::normal_lpdf(beta_s, mu_beta, sigma_beta) -
    stan::math::normal_lpdf(beta, mu_beta, sigma_beta);

  if (RUN_PAR) {
    tbb::parallel_for(
        tbb::blocked_range<int>(0, dn), [&](tbb::blocked_range<int> r) {
          for (int ii = r.begin(); ii < r.end(); ++ii) {
            if (status.at(ii) == 1)
              logr_beta += (beta_s - beta) * dist(ii);
            logr_beta -= tdiff(ii) * kappa(acfrom.at(ii)) * tau(sid.at(ii)) *
                         (std::exp((theta(sid.at(ii)) + beta_s) * dist(ii)) -
                          std::exp((theta(sid.at(ii)) + beta) * dist(ii)));
          }
        });
  } else {
    for (int ii = 0; ii < dn; ii++) {
      if (status.at(ii) == 1)
        logr_beta += (beta_s - beta) * dist(ii);
      logr_beta -= tdiff(ii) * kappa(acfrom.at(ii)) * tau(sid.at(ii)) *
                   (std::exp((theta(sid.at(ii)) + beta_s) * dist(ii)) -
                    std::exp((theta(sid.at(ii)) + beta) * dist(ii)));
    }
  }

  // accept or reject?
  if ((logr_beta > 0.0) ||
      (logr_beta > std::log(stan::math::uniform_rng(0.0, 1.0, rng)))) {
    beta = beta_s;
    acc_beta += 1.0;
  }
}
