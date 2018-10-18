#! /bin/bash
count=$#
if [ $count -eq 0 ];
then
	echo 'Usage : xcall command'
	echo '	Example1: xcall jps'
	exit -1
fi

dirpath=`dirname $0`
START_HOST=`cat $dirpath/xcall.conf |grep START_HOST | sed -e 's/^START_HOST=//'`
END_HOST=`cat $dirpath/xcall.conf |grep END_HOST | sed -e 's/^END_HOST=//'`
JAVA_HOME=`cat $dirpath/xcall.conf | grep JAVA_HOME | sed -e 's/^JAVA_HOME=//'`
CLUSTER_PREFIX_HOSTNAME=`cat $dirpath/xcall.conf | grep CLUSTER_PREFIX_HOSTNAME | sed -e 's/^CLUSTER_PREFIX_HOSTNAME=//'`

if [[ $cmd == 'jps' ]];
then
	cmd=$JAVA_HOME/bin/jps;
else
	cmd=$@
fi

for((i=START_HOST; i<=END_HOST; i++)) 
{
	echo ---------------------$CLUSTER_PREFIX_HOSTNAME$i---------------------
	ssh atguigu@$CLUSTER_PREFIX_HOSTNAME$i "source /etc/profile&&$cmd"
}
