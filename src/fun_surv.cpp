#include "log_surv.h"

double log_surv(double t, double kappa, double tau, double theta, double beta, double Dml) {
    return t * kappa * tau * std::exp((theta + beta) * Dml);
}
