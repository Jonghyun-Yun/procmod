#include <RcppArmadillo.h>
// [[Rcpp::depends(RcppArmadillo)]]

using namespace Rcpp;
// [[Rcpp::export]]

NumericMatrix cosdist(NumericMatrix Ar) {
    int m = Ar.nrow(),
        k = Ar.ncol();
    arma::mat A = arma::mat(Ar.begin(), m, k, false);
    arma::colvec An =  sum(square(A),1); // square(): element-wise
    // colsum: sum(..,0),  rowsum: sum(..,1)
    arma::mat C = (A * A.t());
    C.each_col() /= sqrt(An);
    C.each_row() /= sqrt(An.t());
    return wrap(C);
}
