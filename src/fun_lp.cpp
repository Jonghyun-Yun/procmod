#include "fun_lp.h"

double fun_lp(double &llike_, double &lpri_, const Eigen::VectorXd a_kappa,
              const Eigen::VectorXd b_kappa, const Eigen::VectorXd a_tau,
              const Eigen::VectorXd b_tau, const double mu_theta,
              const double sigma, const double mu_beta, const double sigma_beta,
              const double a_sigma, const double b_sigma,
              const double mu_mu_beta, const double sigma_mu_beta,
              const double a_sigma_beta, const double b_sigma_beta,
              const Eigen::VectorXd &kappa, const Eigen::VectorXd &tau,
              const Eigen::VectorXd &theta, const double beta,
              const std::vector<int> &sid, const std::vector<int> &acfrom,
              const Eigen::VectorXd &tdiff, const std::vector<int> &status,
              const Eigen::VectorXd &dist, const int dn, const bool RUN_PAR) {

  using stan::math::to_vector;
  using stan::math::distance;
  using stan::math::exp;
  using stan::math::square;
  using stan::math::normal_lpdf;
  using stan::math::lognormal_lpdf;
  using stan::math::gamma_lpdf;
  using stan::math::inv_gamma_lpdf;

  double lp_ = 0.0;
  // init for sum
  llike_ = 0.0;

  if (RUN_PAR) {
    tbb::parallel_for(
        tbb::blocked_range<int>(0, dn), [&](tbb::blocked_range<int> r) {
          for (int ii = r.begin(); ii < r.end(); ++ii) {
      if (status.at(ii)==1)
          llike_ += std::log(kappa(acfrom.at(ii))) + std::log(tau(sid.at(ii))) + (theta(sid.at(ii)) + beta) * dist(ii);
      llike_ -= tdiff(ii) * kappa(acfrom.at(ii)) * tau(sid.at(ii)) * std::exp((theta(sid.at(ii)) + beta) * dist(ii));
          }});
  } else {
  for (int ii = 0; ii < dn; ii++) {
      if (status.at(ii)==1)
          llike_ += std::log(kappa(acfrom.at(ii))) + std::log(tau(sid.at(ii))) + (theta(sid.at(ii)) + beta) * dist(ii);
      llike_ -= tdiff(ii) * kappa(acfrom.at(ii)) * tau(sid.at(ii)) * std::exp((theta(sid.at(ii)) + beta) * dist(ii));
  }
  }
  // priors...
  lpri_ = inv_gamma_lpdf(square(sigma), a_sigma, b_sigma) +
          gamma_lpdf(to_vector(kappa), to_vector(a_kappa), to_vector(b_kappa)) +
          gamma_lpdf(to_vector(tau), to_vector(a_tau), to_vector(b_tau)) +
          normal_lpdf(beta, mu_beta, sigma_beta) +
          normal_lpdf(mu_beta, mu_mu_beta, sigma_mu_beta) +
          inv_gamma_lpdf(square(sigma_beta), a_sigma_beta, b_sigma_beta) +
          normal_lpdf(to_vector(theta), mu_theta, sigma);

  lp_ = llike_ + lpri_;
  return lp_;
}
