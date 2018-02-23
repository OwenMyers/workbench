#include <iostream>
//#include <boost/filesystem.hpp>
#include <fftw3.h>
#include <math.h>

#define REAL 0
#define IMAG 1

using namespace std;

int do_math(float arg1, int arg2) {
    return arg2;
}

int call_a_func(int (*call_this)(float, int)) {
    int output = call_this(5.5, 7);
    return output;
}

int main()
{
    //int final_result = call_a_func(&do_math);

    //cout << "final_result " << final_result << endl;
    
    int N = 64;
    fftw_complex signal[N];
    fftw_complex result[N];

    fftw_plan fftwPlan = fftw_plan_dft_1d(N,
                                        signal,
                                        result,
                                        FFTW_FORWARD,
                                        FFTW_ESTIMATE);

    for (int i = 0; i < N; i++){
        double theta = (double)i / (double)N * M_PI;
        signal[i][REAL] = 1.0 * cos(10.0 * theta) +
                          0.5 * cos(25.0 * theta);

        signal[i][IMAG] = 1.0 * sin(10.0 * theta) +
                          0.5 * sin(25.0 * theta);

    }

    fftw_execute(fftwPlan);
    fftw_destroy_plan(fftwPlan);



    
    return 0;
}
