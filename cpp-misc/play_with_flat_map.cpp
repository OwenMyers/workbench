#include <iostream>
#include <vector>
#include </usr/local/Cellar/boost/1.60.0_1/include/boost/container/flat_map.hpp>

using namespace std;


int main()
{
    // make a vector to play with 
    vector<int> myvector;
    for (int i=0; i<5; i++)
    {
        myvector.push_back(i+100);
    }

    // make a flat_map that maps a string to an iterator. In this cas the iterator is of a type over a vector of integers.
    boost::container::flat_map< string , vector<int>::iterator> fmap;

    // Now that we have the flat map specified lets fill it with something.
    // Make an iterator that is set at the begining of the vector we made.
    vector<int>::iterator it = myvector.begin();

    // set the key "first_it" to refer to the iterator we made.
    fmap["first_it"] = it;

    // Now that it is set up use the key to get the iterator
    vector<int>::iterator cur_it = fmap["first_it"]; 

    // If you have the right thing you should be about to loop with the iterator and pring the
    // contents of myvector.
    
    cout << "printing the contents of the iterator we got from the flat_map:" << endl;

    for (; cur_it != myvector.end(); cur_it++)
    {
        cout << "value: " << *cur_it << endl;
    }

    // just let us know we made it to the end.
    cout<<"End of program"<<endl;

    return 0;
}

