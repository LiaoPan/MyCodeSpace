#include <iostream>
#include <armadillo>

using namespace std;
using namespace arma;

int main(int argc, char** argv)
  {
  mat A = randu<mat>(10,10);
  mat B = randu<mat>(10,10);

  cout << A*B.t() << endl;

  return 1;
  }
