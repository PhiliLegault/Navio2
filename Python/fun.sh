#!/bin/bash
> testData.txt
python -u AccelGyroMag.py -i lsm >> testData.txt &

while true 
do     
    # get last x and y values 
    tail -n 1 testData.txt  > magLine.log
    x=`awk '{print $1}' magLine.log`
    y=`awk '{print $2}' magLine.log`
    
    echo "x val $x"
    echo "y val $y"
    
    pi=`echo "4*a(1)" | bc -l`
    degree=`awk "BEGIN {print atan2($y,$x);}"`
    degree=`echo "(( $degree * 180 ) / $pi)" | bc -l`

    if [[ $(echo "$degree < 0" | bc -l) ]]; then
        degree=`echo "( 360 + $degree )" | bc -l`
    fi

   
    degree=$( printf "%.0f" $degree )
    echo "degree value: 00:$degree"
    sleep 1
    
done

