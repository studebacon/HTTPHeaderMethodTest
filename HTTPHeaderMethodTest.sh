#!/bin/bash

if [ -z "$1" ]
then
        echo "HTTPHeaderMethodTest.sh <INPUT FILE> <OPTIONAL HTTP METHOD>"
        exit 1
else
        FILE=$1
fi

if [ -z "$2" ]
then
        METHOD="GET"
else
        METHOD=$2
fi

if [ -f "$FILE" ]
then
        while read p; do 
                echo "RESPONSE HEADERS FROM: $p"; 
                curl -ksLX $METHOD -D - $p -o /dev/null; 
        done <$FILE
fi
