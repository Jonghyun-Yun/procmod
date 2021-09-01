#ifndef FUN_UPDATES_H_
#define FUN_UPDATES_H_

#include <stan/math.hpp>

double update_sigma(const double a_sigma, const double b_sigma,
                    const Eigen::VectorXd &theta, boost::ecuyer1988 &rng);

double update_sigma(const double a_sigma, const double b_sigma,
                    const double theta, boost::ecuyer1988 &rng);

double update_mu(const Eigen::VectorXd &y, const double sigma,
                 const double mu0, const double sigma0,
                 boost::ecuyer1988 &rng);

double update_mu(const double y, const double sigma,
                 const double mu0, const double sigma0,
                 boost::ecuyer1988 &rng);

#endif // FUN_UPDATES_H_
