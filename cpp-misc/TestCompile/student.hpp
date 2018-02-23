#ifndef student_hpp_
#define student_hpp_

class Student{
    public:
        // constructor
        Student();
        void set_id(int to_set);
        int get_id(void);

        // destructor

    private:
        int id_num;

};

#endif
