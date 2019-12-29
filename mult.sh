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

repeat=""


if [ $m ]
then
   repeat=-r
fi

if [ -z $2 ]; then
shufcmd="shuf -i $start-$1 $repeat -n 1"
else
shufcmd="shuf -i $start-$1 $repeat -n $2"
fi

$shufcmd | tr '\n' ' ' | head -c -1; printf '\n'
