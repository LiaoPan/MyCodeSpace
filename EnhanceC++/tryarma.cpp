#include <RcppArmadillo.h>
using namespace Rcpp;
using namespace std;
using namespace arma;
// This is a simple example of exporting a C++ function to R. You can
// source this function into an R session using the Rcpp::sourceCpp 
// function (or via the Source button on the editor toolbar). Learn
// more about Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//   http://gallery.rcpp.org/
//

//[[Rcpp::depends(RcppArmadillo)]]
//[[Rcpp::export]]


mat tryyy(){
  mat A = randu<mat>(10,5);
  mat B = randu<mat>(10,5);
  cout<< A*B.t()<<endl;
  return A;
}


//[[Rcpp::export]]

mat disp(){
  return (randu<mat>(10,26));
}
// You can include R code blocks in C++ files processed with sourceCpp
// (useful for testing and development). The R code will be automatically 
// run after the compilation.
//

/*** R
print("OK1")
tryyy()
disp()
print("OK2")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
*/
