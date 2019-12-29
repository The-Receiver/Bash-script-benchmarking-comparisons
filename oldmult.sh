#!/bin/bash

start=1
while getopts "ml:" opt; do 
 case "${opt}" in
  m) m=1
	;; 
  l) start=$OPTARG;; 
  *) m=0
	;;
  esac
done
   shift $((OPTIND-1))

shufcmd="shuf -e $(seq $start $1)"

if [ $m ]
then
   x=""
   for var in $(seq 1 $2); do
    x=$x' '"$($shufcmd | sed 1q)"
   done
    echo $x
else
$shufcmd | sed $2q | tr '\n' ' ' | head -c -1
printf '\n'
fi
