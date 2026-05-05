#include <R.h>
#include <Rinternals.h>

SEXP add_two(SEXP x) {
    if (!Rf_isReal(x) || LENGTH(x) != 1)
        Rf_error("Expected a numeric scalar");

    double val = REAL(x)[0];
    SEXP result = PROTECT(Rf_allocVector(REALSXP, 1));
    REAL(result)[0] = val + 2.0;
    UNPROTECT(1);
    return result;
}