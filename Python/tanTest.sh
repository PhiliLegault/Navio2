#!/bin/bash

y=$1
x=$2
echo "x value: $x"
echo "y value: $y"

pi=`echo "4*a(1)" | bc -l`

if [[ $y -gt 0 ]]; then 
    degree=`echo "90-(a($x/$y)*(180/$pi))" | bc -l`
elif [[ $y -lt 0 ]]; then 
    degree=`echo "270-(a($x/$y)*(180/$pi))" | bc -l`
elif [[ $y -eq 0 ]] && [[ $x -lt 0 ]]; then 
    degree="180"
elif [[ $y -eq 0 ]] && [[ $x -gt 0 ]]; then 
    degree="0"
else 
    echo "failed to get degree"
fi


degree=$( printf "%.0f" $degree )
echo "degree value: 00:$degree"
