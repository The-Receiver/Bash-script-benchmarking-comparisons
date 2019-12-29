	#!/bin/bash

start=1

#m: Repeat numbers
#l: Set lower bound
#n: Do not truncate to one line
while getopts "nml:" opt; do 
 case "${opt}" in
  m) m=1;; 
  l) start=$OPTARG;; 
  n) trunc=0;;
  *) m=0; trunc=0;;
  esac
done
   shift $((OPTIND-1))

repeat=""
if [ $m ]
then
   repeat=-r
fi

if [ $2 -eq 0 ]; then
shufcmd="shuf -i $start-$1 $repeat -n 1"
else
shufcmd="shuf -i $start-$1 $repeat -n $2"
fi

if [ $trunc -eq 1 ]; then
$shufcmd | tr '\n' ' ' | head -c -1; printf '\n'
else
$shufcmd
fi	

