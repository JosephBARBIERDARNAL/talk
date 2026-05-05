#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
double add_one(double x) {
  return x + 1;
}