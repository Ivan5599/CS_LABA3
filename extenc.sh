#!/bin/bash
                                                                                                                                                                                                                  
cd /home/grid/testbed/tb371/lab3
ml icc                                                                                                                                                                                                            
exts=`cat /proc/cpuinfo | grep flags | cut -d: -f2 | uniq`
for i in $exts
do
        icc -qopt-report=2  -qopt-report-phase=vec -D NOALIAS -D ALIGNED -ipo fibonacci.cpp -o fib_ext -x$i 2>/dev/null
        if [ $? -eq 0 ]
        then
                printf "\nEXTENSION: $i"
                time ./fib_ext
        fi
done