#!/bin/bash
> testData.txt
python AccelGyroMag.py -i lsm >> testData.txt &
echo "sleep for 10 seconds to start gathering data"
sleep 10
echo "done sleeping"
while true 
do     
    # get last x and y values 
    echo "length of file: "
    echo `wc -l testData.txt`
    echo " "
    echo "file contents: "
    tail testData.txt
    # lenghtOfFile=`wc -l testData.txt | grep -Eo '[0-9]'`
    # sed "$lenghtOfFile q;d" testData.txt
    # sed "$(( $lenghtOfFile - 1 )) q;d" testData.txt



    # test values from running original script not represented.
    # causes issue with chance of double values
    # tail -n 1 testData.log  > magLine.log
    # x=`awk '{print $1}' magLine.log | tr -d '+'`
    # y=`awk '{print $2}' magLine.log`
    
    # echo $x
    # echo $y
    
    # #x=$( printf "%.0f" $x )
    # #y=$( printf "%.0f" $y )

    # #./tanTest.sh $x $y

    # # ./tanTest.sh $x $y >> bearing.log
    # # tail -n 1 bearing.log 
    sleep 3
    
done

