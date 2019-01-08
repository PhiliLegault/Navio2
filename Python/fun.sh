#!/bin/bash
> testData.txt
python -u AccelGyroMag.py -i lsm >> testData.txt &

while true 
do     
    # get last x and y values 
    echo "length of file: "
    echo `wc -l testData.txt`
    echo " "
    echo "file contents: "
    tail -n 1 testData.txt
    # lenghtOfFile=`wc -l testData.txt | grep -Eo '[0-9]'`
    # sed "$lenghtOfFile q;d" testData.txt
    # sed "$(( $lenghtOfFile - 1 )) q;d" testData.txt



    # test values from running original script not represented.
    # causes issue with chance of double values
    tail -n 1 testData.log  > magLine.log
    x=`awk '{print $1}' magLine.log | tr -d '+'`
    y=`awk '{print $2}' magLine.log`
    
    echo "x val for tan test: $x"
    echo "y val fro tan test: $y"
    
    # #x=$( printf "%.0f" $x )
    # #y=$( printf "%.0f" $y )

    # #./tanTest.sh $x $y

    # # ./tanTest.sh $x $y >> bearing.log
    # # tail -n 1 bearing.log 
    sleep 1
    
done

