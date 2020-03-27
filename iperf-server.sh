#!/bin/bash
echo
echo
echo "Usage: iperf-server.sh PORT INSTANCE"
echo
i=0

PORT=$1
INSTANCE=$2

if [ -z $PORT ]
then echo "Missing Starting Port Number" && exit 1
fi

if [ -z $INSTANCE ]
then echo "Missing Instance Count" && exit 1
fi
echo
echo
echo
echo "Starting Iperf..."
echo
echo
echo
sleep 2
while [ $i -le $INSTANCE ]

do
	iperf3 -s -p $PORT &
	i=$(( $i + 1  ))
	PORT=$(( $PORT + 1))

done
