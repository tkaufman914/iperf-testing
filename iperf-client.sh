#!/bin/bash
TEST_NO=$2
IP_ADDR=$1
PORT=$3
INSTANCE=$4
i=0
if [ -z $IP_ADDR ]
then echo "Missing IP Address" && exit 1
fi
if [ -z $TEST_NO ]
then echo "Missing test number" && exit 1
fi
if [ -z $PORT ]
then echo "Missing Starting Port Number" && 1
fi
echo "Starting iperf3"
while [ $i -le $INSTANCE ]
do
  echo $i
  echo $PORT
  "iperf3 -c $IP_ADDR -t 10 -P5 -p $PORT --json >> ${IP_ADDR}-test${TEST_NO}-stream${i}.json &"
  i=$(( $i + 1  ))
  PORT=$(( $PORT + 1))
done
