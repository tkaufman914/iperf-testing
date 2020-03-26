#!/bin/bash

PORT=$1

if [ -z $PORT ]
then echo "Missing Starting Port Number" && exit 1
fi

SPORT=$(( $PORT / 10 ))

for i in {0..4}
do iperf3 -s -p $SPORT$i &
done
