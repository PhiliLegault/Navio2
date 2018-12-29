#!/bin/bash

x=$1
y=$2


 
pi=`echo "4*a(1)" | bc -l`
#radx=`echo "$x*($pi/180)" | bc -l`
#rady=`echo "$y*($pi/180)" | bc -l`

if [[ $y -gt 0 ]]; then 
    atanRad=`echo "90-(a($x/$y)*(180/$pi))" | bc -l`
elif [[ $y -lt 0 ]]; then 
    atanRad=`echo "270-(a($x/$y)*(180/$pi))" | bc -l`
elif [[ $y -eq 0 ]] && [[ $x -lt 0 ]]; then 
    atanRad="180"
elif [[ $y -eq 0 ]] && [[ $x -gt 0 ]]; then 
    atanRad="0"
else 
    echo "failed to get degree"
fi


atanRad=$( printf "%.0f" $atanRad )
echo "00:$atanRad"
