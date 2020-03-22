#!/bin/bash
                                                                                                                                                                                                                  
cd /home/grid/testbed/tb371/lab3
ml icc                                                                                                                                                                                                            
g++ fibonacci.cpp -o fib
time ./fib
icc -O1 fibonacci.cpp -o fib1
time ./fib1
icc -O2 -D NOFUNCCALL -qopt-report=2 -qopt-report-phase=vec fibonacci.cpp -o fib2
time ./fib2
icc -qopt-report=2 -qopt-report-phase=vec -D NOALIAS fibonacci.cpp -o fib3
time ./fib3
icc -qopt-report=4 -qopt-report-phase=vec -D NOALIAS -D ALIGNED fibonacci.cpp -o fib4
time ./fib4
icc -qopt-report=2 -qopt-report-phase=vec -D NOALIAS -D ALIGNED -ipo fibonacci.cpp -o fib5
time ./fib5