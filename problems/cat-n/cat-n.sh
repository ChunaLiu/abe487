#!/bin/bash
function USAGE() {
          printf "Usage:  %s   file\n" $(basename $0)

         echo "Please only input file name:"
         exit ${1:-0}
       }

    
       if [[ $# -eq 0 ]]; then 
        USAGE 1
       fi



FILENAME=$1

count=0

cat $FILENAME | while read LINE

do

let count++

echo "$count $LINE"

done





