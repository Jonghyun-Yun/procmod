#include <stan/math.hpp>
#include "tbb/blocked_range2d.h"
#include "tbb/blocked_range3d.h"
#include <iostream>

// read txt to vec
#include <iterator>
#include <sstream>

// basic file operations
#include <fstream>
// #include <cmath>
#include <cstdlib>  // to process main(arguemnts)
#include <ctime>    // std::time
// #include <typeinfo> // typeid(a).name()
#include <string>
#include <vector>

// #include "is_empty.h"
#include "create_rng.hpp"
#include "readCSV.h"
#include "txt2vec.h"
#include "update_kappa.h"
#include "update_tau.h"
#include "update_theta.h"
#include "update_beta.h"
#include "fun_lp.h"
#include "fun_updates.h"
// #include "ars.hpp"
// #include "logdensity.h"

// typedef Eigen::Map<Eigen::MatrixXd> MapMatd;
// typedef Eigen::Map<Eigen::VectorXd> MapVecd;
// typedef Eigen::Block<Eigen::MatrixXd> BlkMatd;

// use using instead!
// map c++ array to Eigen
typedef Eigen::Map<Eigen::MatrixXd> MapMatd;
typedef Eigen::Map<Eigen::VectorXd> MapVecd;

// map c++ array to Eigen matrix by rows
typedef Eigen::Map<Eigen::Matrix<double, Eigen::Dynamic, Eigen::Dynamic, Eigen::RowMajor>> MapMatdRow;

// see https://eigen.tuxfamily.org/dox/structEigen_1_1IOFormat.html
const static Eigen::IOFormat CSVFormatN(Eigen::StreamPrecision,
                                        Eigen::DontAlignCols, ", ", "\n");

// format matrix by row vectors (all separated by commas)
const static Eigen::IOFormat CSVFormat(Eigen::StreamPrecision,
                                       Eigen::DontAlignCols, ", ", ", ");

const static Eigen::IOFormat CommaInitFmt(Eigen::StreamPrecision,
                                          Eigen::DontAlignCols, ", ", ", ", "",
                                          "", "", "\n");

// // NOTE: inline function may speed up the run time, but it may slow down the compilatoin time.
// // https://www.edureka.co/blog/inline-function-in-cpp/
// inline double update_sigma(const double& a_sigma, const double &b_sigma,
//                            const Eigen::VectorXd &theta, boost::ecuyer1988 &rng) {
//   return stan::math::sqrt(stan::math::inv_gamma_rng(a_sigma + 0.5 * theta.array().size(), b_sigma + 0.5 * theta.array().square().sum(), rng));
// }

int main(int argc, const char *argv[]) {

  // rand() has to be seeded
  srand((unsigned)time(NULL));

  std::vector<std::string> sarg;
  sarg.assign(argv, argv + argc);

  int chain_id = atoi(argv[1]);
  int num_samples = atoi(argv[2]);
  int num_warmup = atoi(argv[3]);
  int thin = atoi(argv[4]);

  // use Intel TBB?
  bool RUN_PAR;
  if (sarg[5] == "parallel") {
    RUN_PAR = true;
  } else if (sarg[5] == "serial") {
    RUN_PAR = false;
  } else {
    std::cout << "invalid arguemnt for RUN_PAR.\n" << std::endl;
    return 0;
  }

  // log like and prior
  double llike_ = 0.0;
  double lpri_ = 0.0;
  // log-posterior
  double lp_ = llike_ + lpri_;
  int num_print;

  int num_iter = num_samples + num_warmup;
  if (num_iter < 100) {
    num_print = 1;
  }
  else {
    num_print = num_iter / 100;
  }

  std::ofstream osummary, osample;
  std::stringstream fstart, fsummary, fsample;
  // std::streingtream fwarmup;

  // MCMC chain configuration
  fstart << "./output/start.csv";

  // acceptance rate
  fsummary << "./output/summary.csv";

  // posterior samples
  fsample << "./output/sample_chain" << chain_id << ".csv";

  // use current time as seed for random generator
  int rseed = (unsigned int)time(0) / 2;
  boost::ecuyer1988 rng = create_rng(rseed, chain_id);
  (void)rng; // suppress unused var warning

  std::cout << std::fixed << std::setprecision(1);
  osummary.open(fstart.str(), std::ios::app);
  if (!osummary.is_open()) {
    std::cout << "cannot open the log file:" << fstart.str() << "\n";
    return 0;
  }
  // if (is_empty(osummary)) inp << ".chain, " << "seed, " << "iter, " << "warm,
  // " << "thin" << std::endl;
  osummary << chain_id << ", " << rseed << ", " << num_samples << ", " << num_warmup
           << ", " << thin << std::endl;
  osummary.close();

  std::cout << "Reading data sets...\n";
  Eigen::MatrixXd mvar(1, 5);
  mvar = readCSV("input/mvar.csv", 1, mvar.cols());
  const int M = mvar(0, 0);
  const int N = mvar(0, 1);
  const int dq = mvar(0, 2);
  const int dn = mvar(0, 3); // data rows
  const int dc = mvar(0, 4); // data columns

  Eigen::MatrixXd dat(dn, dc);
  Eigen::MatrixXd trans(dq, dq); // transition
  // Eigen::MatrixXd Dml(M, M); // cosine similarity-ish

  dat = readCSV("input/dat.csv", dn, dc);
  trans = readCSV("input/trans.csv", dq, dq);
  // Dml = readCSV("input/Dml.csv", M, M);

  Eigen::VectorXd tmp_sid = dat.col(0);
  Eigen::VectorXd tmp_acfrom = dat.col(1);
  Eigen::VectorXd tmp_acto = dat.col(2);
  Eigen::VectorXd tstart = dat.col(3);
  Eigen::VectorXd tstop = dat.col(4);
  Eigen::VectorXd tdiff = tstop - tstart; // dat.col(5)
  Eigen::VectorXd tmp_status = dat.col(6);
  Eigen::VectorXd tmp_response = dat.col(7);
  // dat.col(8): trans
  Eigen::VectorXd dist = dat.col(9);

  // Eigen::VectorXi sid;
  // Eigen::VectorXi acfrom;
  // Eigen::VectorXi acto;
  // Eigen::VectorXi status;
  // Eigen::VectorXi response;

  std::vector<int> sid(tmp_sid.data(), tmp_sid.data() + tmp_sid.rows() * tmp_sid.cols());
  std::vector<int> acfrom(tmp_acfrom.data(), tmp_acfrom.data() + tmp_acfrom.rows() * tmp_acfrom.cols());
  std::vector<int> acto(tmp_acto.data(), tmp_acto.data() + tmp_acto.rows() * tmp_acto.cols());
  std::vector<int> status(tmp_status.data(), tmp_status.data() + tmp_status.rows() * tmp_status.cols());
  std::vector<int> response(tmp_response.data(), tmp_response.data() + tmp_response.rows() * tmp_response.cols());

  // sid = tmp_sid.cast<int>();
  // acfrom = tmp_acfrom.cast<int>();
  // acto = tmp_acto.cast<int>();
  // status = tmp_status.cast<int>();
  // response = tmp_response.cast<int>();

  std::cout << "Reading index sets...\n";
  std::ifstream fperson("input/person_index.txt");
  std::ifstream foos("input/out-of-state_index.txt");

  std::vector<std::vector<int>> person_idx;
  std::vector<std::vector<int>> oos_idx;
  person_idx = txt2vec(fperson);
  oos_idx = txt2vec(foos);

  // // integer conversion
  // mseg = tmp_mseg.cast<int>();
  // mY = tmp_mY.cast<int>();

  std::cout << "Reading hyperparameters...\n";
  Eigen::MatrixXd hyper_kappa(M, 3);
  Eigen::MatrixXd hyper_beta(1, 1);
  Eigen::MatrixXd hyper_theta(N, 3);
  Eigen::MatrixXd hyper_tau(N, 3);
  Eigen::MatrixXd hyper_sigma(1, 2);
  Eigen::MatrixXd hyper_mu_beta(1, 2);
  Eigen::MatrixXd hyper_sigma_beta(1, 2);

  hyper_kappa = readCSV("input/hyper_kappa.csv", M, 3);
  hyper_tau = readCSV("input/hyper_tau.csv", N, 3);
  hyper_theta = readCSV("input/hyper_theta.csv", N, 3);
  hyper_beta = readCSV("input/hyper_beta.csv", 1, 3);
  hyper_sigma = readCSV("input/hyper_sigma.csv", 1, 2);
  hyper_mu_beta = readCSV("input/hyper_mu_beta.csv", 1, 2);
  hyper_sigma_beta = readCSV("input/hyper_sigma_beta.csv", 1, 2);

  std::cout << "Reading hyperparameters for kappa...\n";
  Eigen::VectorXd a_kappa(M);
  Eigen::VectorXd b_kappa(M);
  Eigen::VectorXd jump_kappa(M);

  a_kappa = hyper_kappa.leftCols(1);
  b_kappa = hyper_kappa.col(1);
  jump_kappa = hyper_kappa.rightCols(1);

  std::cout << "Reading hyperparameters for beta...\n";
  double jump_beta;
  jump_beta = hyper_beta(0,0);

  std::cout << "Reading hyperparameters for theta...\n";
  double mu_theta = 0.0;
  // Eigen::VectorXd sigma_theta(N);
  Eigen::VectorXd jump_theta(N);

  // mu_theta = hyper_theta.leftCols(1);
  // sigma_theta = hyper_theta.block(0,1,N,1);
  jump_theta = hyper_theta.col(0);

  std::cout << "Reading hyperparameters for sigma...\n";
  double a_sigma = hyper_sigma(0,0);
  double b_sigma = hyper_sigma(0,1);

  std::cout << "Reading hyperparameters for tau...\n";
  Eigen::VectorXd a_tau(N);
  Eigen::VectorXd b_tau(N);
  Eigen::VectorXd jump_tau(N);

  a_tau = hyper_tau.leftCols(1);
  b_tau = hyper_tau.col(1);
  jump_tau = hyper_tau.rightCols(1);

  std::cout << "Reading hyperparameters for sigma_beta...\n";
  double a_sigma_beta = hyper_sigma_beta(0,0);
  double b_sigma_beta = hyper_sigma_beta(0,1);

  std::cout << "Reading hyperparameters for mu_beta...\n";
  double mu_mu_beta = hyper_mu_beta(0,0);
  double sigma_mu_beta = hyper_mu_beta(0,1);

  std::cout << "Initializing parameters...\n";
  // parameters
  Eigen::VectorXd kappa(M);
  Eigen::VectorXd tau(N);
  Eigen::VectorXd theta(N);
  double beta;
  double sigma;
  double mu_beta;
  double sigma_beta;

  // accept_stat
  Eigen::VectorXd acc_kappa = Eigen::VectorXd::Zero(M);
  Eigen::VectorXd acc_tau = Eigen::VectorXd::Zero(N);
  Eigen::VectorXd acc_theta = Eigen::VectorXd::Zero(N);
  double acc_beta = 0.0;
  double acc_sigma = 0.0;

  std::cout << "Initializing...\n";
  kappa = readCSV("input/init_kappa.csv", M, 1);
  tau = readCSV("input/init_tau.csv", N, 1);
  theta = readCSV("input/init_theta.csv", N, 1);
  sigma = readCSV("input/init_sigma.csv", 1, 1)(0);
  beta = readCSV("input/init_beta.csv", 1, 1)(0);
  mu_beta = readCSV("input/init_mu_beta.csv", 1, 1)(0);
  sigma_beta = readCSV("input/init_sigma_beta.csv", 1, 1)(0);

  std::cout << std::fixed << std::setprecision(1);
  osample.open(fsample.str(), std::ios::app);
  if (!osample.is_open()) {
    std::cout << "cannot open the log file:" << fsample.str() << "\n";
    return 0;
  }

  std::cout << "Starting Sampling...\n";

  for (int ii = 1; ii <= num_iter; ii++) {

    std::clock_t c_start = std::clock();

    if (RUN_PAR) {
        tbb::parallel_for(
            tbb::blocked_range<int>(0, M), [&](tbb::blocked_range<int> r) {
        for (int m = r.begin(); m < r.end(); ++m) {
          if (oos_idx.at(m).at(0) >= 0) {
            // std::cout << "m:" << m << "\n";
            update_kappa(kappa(m), acc_kappa(m), a_kappa(m), b_kappa(m),
                         jump_kappa(m), sigma, tau, theta, beta, oos_idx.at(m),
                         sid, tdiff, status, dist, rng);
          }
        }}
    );
        tbb::parallel_for(
            tbb::blocked_range<int>(0, N), [&](tbb::blocked_range<int> r) {
              for (int k = r.begin(); k < r.end(); ++k) {
                if (person_idx.at(k).at(0) >= 0) {
                  // std::cout << "k:" << k << "\n";
                  update_tau(tau(k), acc_tau(k), a_tau(k), b_tau(k),
                             jump_tau(k), sigma, kappa, theta(k), beta,
                             person_idx.at(k), sid, acfrom, tdiff, status, dist,
                             rng);
                  update_theta(theta(k), acc_theta(k), mu_theta, jump_theta(k),
                               sigma, kappa, tau(k), beta, person_idx.at(k),
                               sid, acfrom, tdiff, status, dist, rng);
                }
              }
            });
    }    // end of RUN_PAR
    else // single thread
    {

      // std::cout << "sampling kappa...\n";
      for (int m = 0; m < M; m++) {
        if (oos_idx.at(m).at(0) >= 0) {
          // std::cout << "m:" << m << "\n";
          update_kappa(kappa(m), acc_kappa(m), a_kappa(m), b_kappa(m),
                       jump_kappa(m), sigma, tau, theta, beta, oos_idx.at(m),
                       sid, tdiff, status, dist, rng);
        }
      }
      // updating theta and tau...
      // std::cout << "sampling tau and theta...\n";
      for (int k = 0; k < N; k++) {
        if (person_idx.at(k).at(0) >= 0) {
          // std::cout << "k:" << k << "\n";
          update_tau(tau(k), acc_tau(k), a_tau(k), b_tau(k), jump_tau(k), sigma,
                     kappa, theta(k), beta, person_idx.at(k), sid, acfrom,
                     tdiff, status, dist, rng);
          update_theta(theta(k), acc_theta(k), mu_theta,
                       jump_theta(k), sigma, kappa, tau(k), beta,
                       person_idx.at(k), sid, acfrom, tdiff, status, dist, rng);
        }
      }
    } // end of serial updating

    // updating beta...
      update_beta(beta, acc_beta, mu_beta, sigma_beta, jump_beta, sigma, kappa,
                  tau, theta, sid, acfrom, tdiff, status, dist, dn, rng, RUN_PAR);


    // std::cout << "updating sigma...\n";
    // updating sigma
    sigma = update_sigma(a_sigma, b_sigma, theta, rng);

    // updating beta hypers
    mu_beta = update_mu(beta, sigma, mu_mu_beta, sigma_mu_beta, rng);
    sigma_beta = update_sigma(a_sigma_beta, b_sigma_beta, (beta - mu_beta), rng);

    // rough estimated run time for 100 iterations
    if (ii == 10) {
      std::clock_t c_end = std::clock();
      double time_elapsed_ms = 10.0 * 1000.0 * (c_end - c_start) / CLOCKS_PER_SEC;
      std::cout << "\n100 iterations would take " << time_elapsed_ms
                << " milliseconds.\n"
                << "Adjust your expectations accordingly!\n\n";
    }

    // print sampling process
    if (((ii % num_print == 0) && (ii > 10)) || ii == num_samples)
      std::cout << "Chain " << std::setw(3) << chain_id << ": "
                << "Iteration: " << std::setw(7) << std::right << ii << " / "
                << std::setw(7) << std::right << num_iter << " ["
                << std::setw(3) << (int)(ii / (double)num_iter * 100) << "%]"
                << (ii <= num_warmup ? "  (Warmup)" : "  (Sampling)")
                << std::endl;

    if ((ii % thin == 0) && (ii > num_warmup)) {

      // std::cout << "calculating log-posterior...\n";
      // evaluate log_posteriror

      // TODO: match prior dimension with double / single z and w
      if (RUN_PAR) {
      } else {
        lp_ = fun_lp(llike_, lpri_, a_kappa, b_kappa, a_tau, b_tau, mu_theta,
                     sigma, mu_beta, sigma_beta, a_sigma, b_sigma, mu_mu_beta,
                     sigma_mu_beta, a_sigma_beta, b_sigma_beta, kappa, tau,
                     theta, beta, sid, acfrom, tdiff, status, dist, dn);
      }
        // save samples to a csv file
        // NOTE: row-major order
        // NOTE: DO NOT change the stream order unless you want to change it
        // everywhere (R script too!)
      osample << chain_id << ", " << ii << ", "
              << kappa.format(CSVFormat) << ", "
              << tau.format(CSVFormat) << ", "
              << theta.format(CSVFormat) << ", "
              << sigma << ", " 
              << beta << ", " 
              << mu_beta << ", " 
              << sigma_beta << ", "
              << llike_ << ", " << lpri_ << ", " << lp_ << std::endl;
    }
    }
    osample.close();

    // writing (overall) acceptance rate... (last column for sigma's acceptance rate = 1)
    osummary.open(fsummary.str(), std::ios::app);
    if (!osummary.is_open()) {
      std::cout << "cannot open the log file:" << fsummary.str() << "\n";
      return 0;
    }
    osummary << chain_id
             // << ", " << acc_kappa.mean() / (double)num_iter
             // << ", " << acc_tau.mean() / (double)num_iter
             << ", " << acc_theta.mean() / (double)num_iter
             << ", " << acc_beta / (double)num_iter
             // << ", " << acc_sigma / (double)num_iter
             << std::endl;
  osummary.close();

  return 1;
}
