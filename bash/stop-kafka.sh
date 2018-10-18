#! /bin/bash
dirpath=`dirname $0`
KAFKA_HOME=`cat $dirpath/kafka.conf |grep KAFKA_HOME | sed -e 's/^KAFKA_HOME=//'`
$dirpath/xcall.sh $KAFKA_HOME/bin/kafka-server-stop.sh stop
echo '---------------------------------------------------'
echo -e '-------------------\033[32mKafka Clusters Stopped\033[0m----------'
$dirpath/xcall.sh jps

