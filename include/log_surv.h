#ifndef LOG_SURV_H_
#define LOG_SURV_H_

#include <stan/math.hpp>

double log_surv(double t, double kappa, double tau, double theta, double beta, double Dml);

#endif // LOG_SURV_H_
