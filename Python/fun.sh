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
    tail -n 1 testData.txt  > magLine.log
    x=`awk '{print $1}' magLine.log | tr -d '+'`
    y=`awk '{print $2}' magLine.log`
    
    echo "x val for tan test: $x"
    echo "y val fro tan test: $y"
    
    pi=`echo "4*a(1)" | bc -l`

    if [[ $y -gt 0 ]]; then 
        degree=`echo "(90-(a($x/$y)*(180/$pi)))*2" | bc -l`
    elif [[ $y -lt 0 ]]; then 
        degree=`echo "(270-(a($x/$y)*(180/$pi))*2)" | bc -l`
    elif [[ $y -eq 0 ]] && [[ $x -lt 0 ]]; then 
        degree="180"
    elif [[ $y -eq 0 ]] && [[ $x -gt 0 ]]; then
        degree="0"
    else 
        echo "failed to get degree"
    fi


    degree=$( printf "%.0f" $degree )
    echo "degree value: 00:$degree"

    # #./tanTest.sh $x $y

    # # ./tanTest.sh $x $y >> bearing.log
    # # tail -n 1 bearing.log 
    sleep 1
    
done

