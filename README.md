# KafkaAWS-AutoScripts

Performance Benchmark of Kafka on AWS
Project descriptionThe aim of the project was to perform a set of experiments to study performance evaluation of Kafka on AWS. The following was done as part of the project:

• Executed a set of experiments on cloud platform provided by AWS. Overall, we used 8 EC2 m3xlarge amazon instances for running brokers, producers and consumers.

• Conducted 12 experimental scenarios for performance measurement such as latency and throughput with publishers publishing and consumers subscribing the data at the same time.

• As a producer node, EC2 instance ran 20 producers which is fixed for all the scenarios. These producers publish data for 10 different topics. We varied cluster size of brokers in the count of 3, 6 and 9 for measuring the impact of performance with increase in number of brokers.

• A number of consumers such as 10, 20, 30 and 40 were executed for subscribing data for each cluster size. For measuring the performance during load, we were considering an on-peak scenario in which 40 consumers try to consume data at the same time and an off- peak scenario in which only 10 consumers are consuming the data, reducing the load.

• Based on the results obtained, we inferred that even with increased latency, Kafka can be an ideal platform for real-time streaming on AWS, combined with benefits of AWS.
