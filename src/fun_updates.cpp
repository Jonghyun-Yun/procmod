#include "fun_updates.h"

namespace jyun {
template <typename T>
T square(const T x){
    return x * x;
}
}

// sampling sigma from normal-inv_gamma model
double update_sigma(const double a_sigma, const double b_sigma,
                    const Eigen::VectorXd &theta, boost::ecuyer1988 &rng) {
  return std::sqrt(stan::math::inv_gamma_rng(
      a_sigma + 0.5 * theta.array().size(),
      b_sigma + 0.5 * theta.array().square().sum(), rng));
}

double update_sigma(const double a_sigma, const double b_sigma,
                    const double theta, boost::ecuyer1988 &rng) {
  return std::sqrt(stan::math::inv_gamma_rng(
      a_sigma + 0.5,
      b_sigma + 0.5 * theta * theta, rng));
}

// sampling mean from normal-normal model
double update_mu(const Eigen::VectorXd &y, const double sigma, const double mu0,
                 const double sigma0, boost::ecuyer1988 &rng) {
  double tau = 1.0 / jyun::square(sigma0) + y.size() / jyun::square(sigma);
  return stan::math::normal_rng(
      (mu0 / jyun::square(sigma0) + y.sum() / jyun::square(sigma)) / tau,
      1.0 / tau, rng);
}

double update_mu(const double y, const double sigma,
                 const double mu0, const double sigma0,
                 boost::ecuyer1988 &rng) {
  double tau = 1.0 / jyun::square(sigma0) + 1.0 / jyun::square(sigma);
  return stan::math::normal_rng(
      (mu0 / jyun::square(sigma0) + y / jyun::square(sigma)) / tau,
      1.0 / tau, rng);
}
