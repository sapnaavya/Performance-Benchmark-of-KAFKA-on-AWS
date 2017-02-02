#!/bin/sh

usage () {
   echo "usage: ./runEndToEndLatency.sh [NoOfLatencyTest] [topic] [ListOfSevers(, separated) in host:port format]"
}

if [[ $# -lt 3 ]]; then
 echo "EXPERIMENT FAILED: Specify number of producers to run"
 usage
 exit
fi

NO_OF_LATENCYTEST=$1
TOPIC=$2
SERVER_LIST=$3

RESULTS_DIR=endToEndLatencyLog

if [ -d $RESULTS_DIR ]; then
 rm -rf $RESULTS_DIR
fi

mkdir -p $RESULTS_DIR

for i in `seq 1 $NO_OF_LATENCYTEST`;
do
    echo ""
    echo "Running EndToEndLatency : $i th"
    bin/kafka-run-class.sh kafka.tools.EndToEndLatency "$SERVER_LIST" "$TOPIC" 100000 1 254 > $RESULTS_DIR/eLog-$i.txt 2>&1 &
done;
