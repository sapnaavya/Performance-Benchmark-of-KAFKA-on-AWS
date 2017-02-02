#!/bin/sh

usage () {
   echo "usage: ./runBrokers.sh [NoOfBrokers] [topic]"
}

if [[ $# -lt 1 ]]; then
 echo "EXPERIMENT FAILED: Specify number of brokers to run"
 usage
 exit
fi

NO_OF_BROKERS=$1
TOPIC=$2

RESULTS_DIR=brokerLog

if [ -d $RESULTS_DIR ]; then
 rm -rf $RESULTS_DIR
fi

mkdir -p $RESULTS_DIR

BROKER_NO=1
for i in `seq 1 $NO_OF_BROKERS`;
do
    echo ""
    echo "Running Broker : $i th"
    ./bin/kafka-server-start.sh config/server-$BROKER_NO.properties > $RESULTS_DIR/bLog-$BROKER_NO.txt 2>&1 &
    let BROKER_NO++
done;