// example from cplusplus.com

#include <iostream>     // std::cout
#include <iterator>     // std::distance
#include <list>         // std::list

int main () {

    std::list<int> mylist;
    for (int i=0; i<10; i++) mylist.push_back (i*10);
    
    std::list<int> seclist = mylist;
      
    std::list<int>::iterator first = mylist.begin();
    std::list<int>::iterator last = seclist.end();
    
    // This will make an infinite loob becasue last will never be reached.
    std::cout << "The distance is: " << std::distance(first,last) << '\n';
    
    return 0;
}
