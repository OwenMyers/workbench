#include <iostream>
#include <vector>
#include </usr/local/Cellar/boost/1.60.0_1/include/boost/container/flat_map.hpp>
#include </usr/local/Cellar/boost/1.60.0_1/include/boost/iterator/filter_iterator.hpp>


using namespace std;

// This will be the filter
struct is_positive_number {
    // overload the () operator 
    bool operator()(int x) {return 0 < x;}
};


int main()
{
    vector<int> some_ints;

    some_ints.push_back(0);
    some_ints.push_back(-1);
    some_ints.push_back(1);
    some_ints.push_back(5);
    some_ints.push_back(-4);
    some_ints.push_back(4);


    // type def the filter iterator with the filter that will be used, and the iterator type for THIS type of filter
    // iterator. 
    typedef boost::filter_iterator<is_positive_number, vector<int>::iterator> int_sign_FI;


    vector<int>::iterator ints_iter_begin = some_ints.begin();
    vector<int>::iterator ints_iter_end = some_ints.end();

    is_positive_number predicate;
    int_sign_FI filter_iter_owen(predicate,ints_iter_begin,ints_iter_end);
    // A really importat point is that this works
    int_sign_FI filter_iter_end(predicate,ints_iter_end,ints_iter_end);
    // BUT THIS DOES NOT -> or rather it works but at the ver end of the loop it prints some random
    // negative number. I think it is accesing a bad point in memory by not reaching the end when it
    // is suposed to.
    //int_sign_FI filter_iter_end(predicate,ints_iter_end);

    // loop over the fillter iterator which will only give values that satisfy the predicate.
    for (; filter_iter_owen != filter_iter_end; ++filter_iter_owen )
    {
        cout << "cur_it: " << *filter_iter_owen << endl;
    }

    return 0;
}
