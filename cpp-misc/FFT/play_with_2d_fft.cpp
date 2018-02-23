#include <iostream>
//#include <boost/filesystem.hpp>
#include <fftw3.h>
#include <math.h>
#include <fstream>

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
    
    int N = 128;
    fftw_complex signal[N*N];
    fftw_complex result[N*N];

//    fftw_plan fftw2d_create_plan(N,N,in,out,FFTW_FORWARD);

    fftw_plan fftwPlan = fftw_plan_dft_2d(N,N,
                                        signal,
                                        result,
                                        FFTW_FORWARD,
                                        FFTW_ESTIMATE);

    ofstream outf;
    outf.open("signal.txt");
    int cur_index = 0;
    // row
    for (int i = 0; i < N; i++){
        // col
        for(int j = 0; j<N; j++){
            double theta = (double)i / (double)N * M_PI;
            double theta2 = (double)j / (double)N * M_PI;

            cur_index = i*N+j;
            signal[cur_index ][REAL] = 1.0 * cos(3.0 * theta) +
                              1.0 * cos(5.0 * theta);
            signal[cur_index ][REAL] += 1.0 * cos(3.0 * theta2) +
                              1.0 * cos(5.0 * theta2);

            //signal[i][IMAG] = 1.0 * sin(3.0 * theta) +
            //                  1.0 * sin(5.0 * theta);
            signal[cur_index ][IMAG] = 0.0;

            outf<< signal[cur_index ][REAL];
            outf<<" ";
        }
        outf<<"\n";
    }
    outf.close();

    fftw_execute(fftwPlan);

    outf.open("result.txt");
    // row
    for (int i = 0; i < N; i++){
        // col
        for(int j = 0; j<N; j++){
            cur_index = i*N+j;

            outf<< result[cur_index ][REAL];

            outf<<" ";
        }
        outf<<"\n";
    }
    outf.close();




    fftw_destroy_plan(fftwPlan);



    
    return 0;
}
