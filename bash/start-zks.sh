#! /bin/bash
dirpath=`dirname $0`
ZK_HOME=`cat $dirpath/zks.conf |grep ZK_HOME | sed -e 's/^ZK_HOME=//'`
$dirpath/xcall.sh $ZK_HOME/bin/zkServer.sh start