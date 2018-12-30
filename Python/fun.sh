#!/bin/bash

python AccelGyroMag.py -i lsm >> testData.log &

while true 
do  
    tail -n 2 testData.log  > magLine.log
    x=`awk '{print $10}' magLine.log | tr -d '+'`
    y=`awk '{print $11}' magLine.log`
    x=$( printf "%.0f" $x )
    y=$( printf "%.0f" $y )
    echo "fun.sh x value $x"
    echo "fun.sh y value: $y"
    ./tanTest.sh $x $y >> bearing.log
    tail -n 1 bearing.log 
    sleep 3
    
done

