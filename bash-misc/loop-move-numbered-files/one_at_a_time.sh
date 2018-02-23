#!/bin/bash

totalnum=`ls ToDoDTA | wc -l`

start="0"

for((i=$start;i<$totalnum;++i)) do
    filetorun=`ls ToDoDTA/ | sort -n | head -1`
    mv ToDoDTA/$filetorun dta/
    wait
    ./ExecutabePyTest/ex_py_test.py
    wait
    mv dta/$filetorun DoneDTA/
done

