#include <iostream>
#include <complex>

using namespace std;

typedef complex<double> dcmplx;


int main()
{
    dcomplex x(2.0,3.0);
    std::cout << "x: " << x << std::endl;
    std::cout << "x/2.0: " << x/2.0 << std::endl;

    return 0;
}
