#!/bin/sh

usage () {
   echo "usage: ./runProducers.sh [NoOfProducers] [topic] [ListOfSevers(, separated) in host:port format] [ProducerFactor]"
}

if [[ $# -lt 4 ]]; then
 echo "EXPERIMENT FAILED: Specify number of producers to run"
 usage
 exit
fi

NO_OF_PRODUCERS=$1
TOPIC=$2
SERVER_LIST=$3

RESULTS_DIR=producerLog
PROD_FACTOR=$4

if [ -d $RESULTS_DIR ]; then
 rm -rf $RESULTS_DIR
fi

mkdir -p $RESULTS_DIR

for i in `seq 1 $NO_OF_PRODUCERS`;
do
    echo ""
    echo "Running Producer : $i th"
    VAL=`expr $TOPIC % $PROD_FACTOR`;
    echo "Val : %VAL" 
    
    ./bin/kafka-topics.sh --zookeeper ec2-35-162-204-121.us-west-2.compute.amazonaws.com:2181 --create --topic "$TOPIC-$VAL" --partitions 3 --replication-factor 2
    
    bin/kafka-run-class.sh org.apache.kafka.tools.ProducerPerformance --topic "$TOPIC-$VAL" --num-records 100000 --record-size 254 --throughput 1000000 --producer-props acks=1 bootstrap.servers="$SERVER_LIST" buffer.memory=508 batch.size=524 > $RESULTS_DIR/pLog-$i.txt 2>&1 &
done;