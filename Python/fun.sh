#!/bin/bash

python AccelGyroMag.py -i lsm >> testData.log &

while true 
do  
    # causes issue with chance of double values
    tail -n 2 testData.log  > magLine.log
    x=`awk '{print $10}' magLine.log | tr -d '+'`
    y=`awk '{print $11}' magLine.log`
    x=$( printf "%.0f" $x )
    y=$( printf "%.0f" $y )

    ./tanTest.sh $x $y

    # ./tanTest.sh $x $y >> bearing.log
    # tail -n 1 bearing.log 
    sleep 3
    
done

