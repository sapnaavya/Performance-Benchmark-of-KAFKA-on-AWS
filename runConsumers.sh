#!/bin/sh

usage () {
   echo "usage: ./runConsumers.sh [NoOfConsumers] [topic] [ListOfZookeeperSevers(, separated) in host:port format]"
}

if [[ $# -lt 3 ]]; then
 echo "EXPERIMENT FAILED: Specify number of consumers to run"
 usage
 exit
fi

NO_OF_CONSUMERS=$1
TOPIC=$2
ZOO_SERVER_LIST=$3

RESULTS_DIR=consumerLog

if [ -d $RESULTS_DIR ]; then
 rm -rf $RESULTS_DIR
fi

mkdir -p $RESULTS_DIR

for i in $NO_OF_CONSUMERS
do
    echo ""
    echo "Running Consumer : $i th"
    bin/kafka-consumer-perf-test.sh --zookeeper "$ZOO_SERVER_LIST" --messages 100000 --topic "$TOPIC" --threads 1 > $RESULTS_DIR/cLog-$i.txt 2>&1 &
done;