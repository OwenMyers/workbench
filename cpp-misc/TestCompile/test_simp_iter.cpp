#include <iostream>
#include <vector>
#include "student.hpp"

using namespace std;

class CourseList {

public:
    typedef vector<Student> StudentList;
    // students is a vector of Student objects
    StudentList students;
    // here we define the iterator. This is created without complaints from the compiler 
    // because a vector is an typed that can be iterated over.
    typedef StudentList::iterator it;
    typedef StudentList::const_iterator const_iterator;
    CourseList(int num_students);
    void asign_id_nums(void);
    
    it begin() { return students.begin(); }
    it end() { return students.end(); }
};

CourseList::CourseList(int num_students)
{
    for(int i = 0; i < num_students; i++)
    {
        students.push_back(Student()); 
    }
}
void CourseList::asign_id_nums(void)
{
    int id_start = 100;

    // iterate over the students
    // One way
    for (it cur_it = begin() ;  cur_it!= end(); ++cur_it )
    {
        (*cur_it).set_id(id_start);

        cout << "Asiging student id: " << (*cur_it).get_id() << endl;
        //cout << "" << << endl;

        id_start++;
    }
    // Another way
    //for(auto & cur: students) 
    //{
    //    cur.set_id(id_start);

    //    cout << "Asiging student id: " << cur.get_id() << endl;
    //    //cout << "" << << endl;

    //    id_start++;
    //}
}

int main()
{
    CourseList cl(10);
    Student st;

    cout << "length of studen_list " << cl.students.size() << endl;

    cl.asign_id_nums();
    //cout << "" << << endl;
    
    
    // See if we can use the distance  fuction correctly
    typedef vector<Student> StudentList;
    StudentList students;
    typedef StudentList::iterator it;

    for(int i = 0; i < 0; i++)
    {
        students.push_back(Student()); 
    }   
    
    using std::distance;
    
    cout << "distance(students.begin(),students.end()): " << 
        distance(students.begin(),students.end()) << endl;

    return 0;
}
