#!/bin/sh

usage () {
   echo "usage: ./publishTopic.sh [topic] [ProducerFactor]"
}

if [[ $# -lt 3 ]]; then
 echo "EXPERIMENT FAILED: Specify number of producers to run"
 usage
 exit
fi

TOPIC=$1
PROD_FACTOR=$2

for i in `seq 1 $PROD_FACTOR`;
do
    echo ""
    echo "Running Producer : $i th"
    VAL=`expr $TOPIC % $PROD_FACTOR`;
    echo "Val : %TOPIC-%VAL" 
    
    ./bin/kafka-topics.sh --zookeeper ec2-35-162-204-121.us-west-2.compute.amazonaws.com:2181 --create --topic "$TOPIC-$VAL" --partitions 3 --replication-factor 2
done;