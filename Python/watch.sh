#!/bin/bash

# analog clock
# pipe this after something that repeatedly prints the time with the HH:MM format

# scheme used for the output
#$(tput cup 0)\
#        0        
#   1    2    3   
# 4   5  6  7   8 
#     9 012 3     
#4 5 6 7 o 8 9 0 1    time
#     2 345 6     
# 7   8  9  0   1 
#   2    3    4   
#        5        


IFS=:
format="%s\
        %s
   %s    %s    %s
 %s   %s  %s  %s   %s
     %s %s%s%s %s
%s %s %s %s o %s %s %s %s    %s
     %s %s%s%s %s
 %s   %s  %s  %s   %s
   %s    %s    %s
        %s
"

space () for i; do clock[i]=' '; done
o () for i; do clock[i]=o; done
hours () for i; do clock[i]=h; done
minutes () for i; do clock[i]=m; done

tput smcup
tput civis
trap 'tput rmcup; tput cnorm' EXIT
pos=$(tput cup 0)
while read -r hh mm; do

  time=$hh:$mm
  (( mm = 10#$mm / 30 ))
  (( hh = 10#$hh % 12 ))
  unset "clock[@]"
  space {0..35}
  o 0 1 3 4 8 14 21 27 31 32 34 35
  case $mm in
    0) minutes 0 2 6 11 ;;
    1) minutes 3 7 12 ;;
    2) minutes 8 13 ;;
    3) minutes 18 19 20 21 ;;
    4) minutes 26 31 ;;
    5) minutes 25 30 34 ;;
    6) minutes 24 29 33 35 ;;
    7) minutes 23 28 32 ;;
    8) minutes 22 27 ;;
    9) minutes 14 15 16 17 ;;
   10) minutes 4 9 ;;
   11) minutes 1 5 10 ;;
  esac
  printf "$format" "$pos" "${clock[@]::22}" "$time" "${clock[@]:22}"
done

exit

