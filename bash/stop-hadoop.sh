#! /bin/bash
dirpath=`dirname $0`

NAMENODE_HOST=`cat $dirpath/hadoop.conf |grep NAMENODE_HOST | sed -e 's/^NAMENODE_HOST=//'`
RESOURCE_HOST=`cat $dirpath/hadoop.conf |grep RESOURCE_HOST | sed -e 's/^RESOURCE_HOST=//'`
HISTORY_SERVER=`cat $dirpath/hadoop.conf |grep HISTORY_SERVER | sed -e 's/^HISTORY_SERVER=//'`

HADOOP_HOME=`cat $dirpath/hadoop.conf |grep HADOOP_HOME | sed -e 's/^HADOOP_HOME=//'`
HADOOP_HOME_CDH=`cat $dirpath/hadoop.conf |grep HADOOP_HOME_CDH | sed -e 's/^HADOOP_HOME_CDH=//'`

CLUSTER_PREFIX_HOSTNAME=`cat $dirpath/xcall.conf | grep CLUSTER_PREFIX_HOSTNAME | sed -e 's/^CLUSTER_PREFIX_HOSTNAME=//'`

stop_dfs_cmd=${HADOOP_HOME}/sbin/stop-dfs.sh
stop_rs_cmd=${HADOOP_HOME}/sbin/stop-yarn.sh
stop_hs_cmd=${HADOOP_HOME}"/sbin/mr-jobhistory-daemon.sh stop historyserver"
echo -e "--------------\033[32m$CLUSTER_PREFIX_HOSTNAME$NAMENODE_HOST\033[0m---------------"
ssh atguigu@$CLUSTER_PREFIX_HOSTNAME$NAMENODE_HOST "source /etc/profile&&${stop_dfs_cmd}"

echo -e "--------------\033[32m$CLUSTER_PREFIX_HOSTNAME$RESOURCE_HOST\033[0m---------------"
ssh atguigu@$CLUSTER_PREFIX_HOSTNAME$RESOURCE_HOST "source /etc/profile&&${stop_rs_cmd}"

echo -e "--------------\033[32m$CLUSTER_PREFIX_HOSTNAME$HISTORY_SERVER\033[0m---------------"
ssh atguigu@$CLUSTER_PREFIX_HOSTNAME$HISTORY_SERVER "source /etc/profile&&${stop_hs_cmd}"

echo '---------------------------------------------------'
echo -e '--------------\033[32mHadoop Clusters Stopped\033[0m---------------'
$dirpath/xcall.sh jps