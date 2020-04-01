#!/bin/bash
TEST_NO=$2
IP_ADDR=$1
PORT=$3
INSTANCE=$4
JSON=$5
echo
echo "Usage: iperf-client.sh  IPaddress TestNumber PortNumber InstanceCount --json"
echo
echo "example: iperf-client.sh 192.168.5.10 5 2001 5 --json"
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
  echo "Test ${i}"
  echo $PORT
     if [ "$JSON" = "--json" ]
      then
          iperf3 -c $IP_ADDR -t 10 -P5 -p $PORT --json >> ${IP_ADDR}-Test-${TEST_NO}-stream${i}.json &
      else
          iperf3 -c $IP_ADDR -t 10 -P5 -p $PORT >> ${IP_ADDR}-Test-${TEST_NO}-stream${i}.txt &
     fi
  i=$(( $i + 1  ))
  PORT=$(( $PORT + 1))
done
