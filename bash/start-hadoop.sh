#! /bin/bash
dirpath=`dirname $0`

NAMENODE_HOST=`cat $dirpath/hadoop.conf |grep NAMENODE_HOST | sed -e 's/^NAMENODE_HOST=//'`
RESOURCE_HOST=`cat $dirpath/hadoop.conf |grep RESOURCE_HOST | sed -e 's/^RESOURCE_HOST=//'`
HISTORY_SERVER=`cat $dirpath/hadoop.conf |grep HISTORY_SERVER | sed -e 's/^HISTORY_SERVER=//'`

HADOOP_HOME=`cat $dirpath/hadoop.conf |grep HADOOP_HOME | sed -e 's/^HADOOP_HOME=//'`
HADOOP_HOME_CDH=`cat $dirpath/hadoop.conf |grep HADOOP_HOME_CDH | sed -e 's/^HADOOP_HOME_CDH=//'`

CLUSTER_PREFIX_HOSTNAME=`cat $dirpath/xcall.conf | grep CLUSTER_PREFIX_HOSTNAME | sed -e 's/^CLUSTER_PREFIX_HOSTNAME=//'`
USER_NAME=`cat $dirpath/xcall.conf | grep USER_NAME | sed -e 's/^USER_NAME=//'`

start_dfs_cmd=${HADOOP_HOME}/sbin/start-dfs.sh
start_rs_cmd=${HADOOP_HOME}/sbin/start-yarn.sh
start_hs_cmd=${HADOOP_HOME}"/sbin/mr-jobhistory-daemon.sh start historyserver"
echo -e "--------------\033[32m$CLUSTER_PREFIX_HOSTNAME$NAMENODE_HOST\033[0m---------------"
ssh $USER_NAME@$CLUSTER_PREFIX_HOSTNAME$NAMENODE_HOST "source /etc/profile&&${start_dfs_cmd}"

echo -e "--------------\033[32m$CLUSTER_PREFIX_HOSTNAME$RESOURCE_HOST\033[0m---------------"
ssh $USER_NAME@$CLUSTER_PREFIX_HOSTNAME$RESOURCE_HOST "source /etc/profile&&${start_rs_cmd}"

echo -e "--------------\033[32m$CLUSTER_PREFIX_HOSTNAME$HISTORY_SERVER\033[0m---------------"
ssh $USER_NAME@$CLUSTER_PREFIX_HOSTNAME$HISTORY_SERVER "source /etc/profile&&${start_hs_cmd}"

echo '---------------------------------------------------'
echo -e '--------------\033[32mHadoop Clusters Started\033[0m---------------'
$dirpath/xcall.sh jps
