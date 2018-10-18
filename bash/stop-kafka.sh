#! /bin/bash
dirpath=`dirname $0`
KAFKA_HOME=`cat $dirpath/kafka.conf |grep KAFKA_HOME | sed -e 's/^KAFKA_HOME=//'`
$dirpath/xcall.sh $KAFKA_HOME/bin/kafka-server-stop.sh stop
nohup $dirpath/xcall.sh "pid=\`ps ax | grep -i 'kafka.Kafka' | grep -v grep | awk '{print \$1}'\` && kill -9 \$pid" >> /dev/null
echo '---------------------------------------------------'
echo -e '-------------------\033[32mKafka Clusters Stopped\033[0m----------'
$dirpath/xcall.sh jps





