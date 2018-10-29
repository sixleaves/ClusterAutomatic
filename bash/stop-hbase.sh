#! /bin/bash
dirpath=`dirname $0`
HBASE_HOME=`cat $dirpath/hbase.conf |grep HBASE_HOME | sed -e 's/^HBASE_HOME=//'`
NAME_NODE=`cat $dirpath/hbase.conf |grep NAME_NODE | sed -e 's/^NAME_NODE=//'`
ssh atguigu@$NAMENODE "$HBASE_HOME/bin/stop-hbase.sh"
