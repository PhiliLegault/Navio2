#!/bin/bash
> testData.log
python AccelGyroMag.py -i lsm >> testData.log &

# while true 
# do  
#     # test values from running original script not represented.
#     # causes issue with chance of double values
#     tail -n 1 testData.log  > magLine.log
#     x=`awk '{print $1}' magLine.log | tr -d '+'`
#     y=`awk '{print $2}' magLine.log`
    
#     echo $x
#     echo $y
    
#     #x=$( printf "%.0f" $x )
#     #y=$( printf "%.0f" $y )

#     #./tanTest.sh $x $y

#     # ./tanTest.sh $x $y >> bearing.log
#     # tail -n 1 bearing.log 
#     sleep 1
    
# done

