#include <iostream>
#include <boost/filesystem.hpp>

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
int final_result = call_a_func(&do_math);
cout << "final_result " << final_result << endl;

return 0;
}
