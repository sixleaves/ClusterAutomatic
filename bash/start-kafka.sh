#! /bin/bash
dirpath=`dirname $0`
KAFKA_HOME=`cat $dirpath/kafka.conf |grep KAFKA_HOME | sed -e 's/^KAFKA_HOME=//'`
$dirpath/xcall.sh nohup $KAFKA_HOME/bin/kafka-server-start.sh -daemon $KAFKA_HOME/config/server.properties  2> /dev/null
echo '---------------------------------------------------'
echo -e '--------------\033[32mKafka Clusters Started\033[0m---------------'
$dirpath/xcall.sh jps


