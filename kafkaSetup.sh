#!/bin/bash

mkdir setUpDir

cp jdk-8u101-linux-x64.tar.gz setUpDir/
cd setUpDir

#Extract and move jdk to opt
tar -zxvf jdk-8u101-linux-x64.tar.gz
mkdir /opt/jdk
mv jdk1.8.0_101 /opt/jdk/

export JAVA_HOME=/opt/jdk/jdk1.8.0_101
export PATH=$PATH:$JAVA_HOME/bin

source ~/.bashrc

#Installing Zookeeper

wget http://www-us.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
tar -zxvf zookeeper-3.4.6.tar.gz
mv zookeeper-3.4.6 /opt/

#Installing Kafka

#wget http://www-eu.apache.org/dist/kafka/0.10.0.1/kafka_2.10-0.10.0.1.tgz
#tar -xzvf kafka_2.10-0.10.0.1.tgz
#mv kafka_2.10-0.10.0.1 /opt/

wget http://www-eu.apache.org/dist/kafka/0.9.0.0/kafka_2.10-0.9.0.0.tgz
tar -xzvf kafka_2.10-0.9.0.0.tgz
mv kafka_2.10-0.9.0.0 /opt/
