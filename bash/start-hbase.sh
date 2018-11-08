#! /bin/bash
dirpath=`dirname $0`
HBASE_HOME=`cat $dirpath/hbase.conf |grep HBASE_HOME | sed -e 's/^HBASE_HOME=//'`
NAME_NODE=`cat $dirpath/hbase.conf |grep NAME_NODE | sed -e 's/^NAME_NODE=//'`
USER_NAME=`cat $dirpath/xcall.conf | grep USER_NAME | sed -e 's/^USER_NAME=//'`
ssh $USER_NAME@$NAME_NODE "$HBASE_HOME/bin/start-hbase.sh"
$dirpath/xcall.sh jps
