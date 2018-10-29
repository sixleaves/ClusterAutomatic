# ClusterAutomatic
This project provides pyhon and bash scripts to automate clusters

该项目分别提供python和bash脚本两种方式,用于自动化集群启动和配置。

- [x] xcall脚本,集群间同步执行命令
- [x] zookeeper集群启动和关闭功能
- [x] kafka集群启动和关闭功能
- [x] hadoop集群启动和关闭功能
- [ ] zookeeper自动化配置
- [ ] kafka自动化配置
- [ ] hadoop自动化配置

# 使用方式

### 前提
- 将以下文件都添加到PATH环境变量中.
- 集群之前配置了免登入ssh

## 一.xcall
#### 配置xcall.conf 配置文件

假设你有**hadoop101~hadoop103**的集群,并且集群上JDK安装于`/opt/module/jdk1.8.0_144`.则配置如下
```bash
START_HOST=101
END_HOST=103
CLUSTER_PREFIX_HOSTNAME=hadoop
JAVA_HOME=/opt/module/jdk1.8.0_144
```

#### Example1: 使用xcall 列出集群中所有的java进程
`xcall.sh jps`

#### Example2: 使用xcall 列出集群中所有/路径下的路径
`xcall.sh ls /`

## ② Hadoop群起
#### 配置hadoop.conf
```bash
# NameNode 所在机器,在hadoop102
NAMENODE_HOST=102

# ResourceManager所在机器,在hadoop101
RESOURCE_HOST=101

# HistoryServer所在机器,在hadoop103
HISTORY_SERVER=103

# Hadoop Home即Hadoop安装根目录
HADOOP_HOME=/opt/module/hadoop-2.7.2
```

## 三.zookeeper群起
#### 配置zks.conf

添加zookeeper安装目录
```bash
# configure zookeeper home in here
ZK_HOME=/opt/module/zookeeper-3.4.10
```
#### Example3： 群起zookeeper
`start-zks.sh`

#### Example4: 关闭zookeeper集群
`stop-zks.sh`

## 四.kafka群起
#### 配置kafka.conf

添加kafka安装目录
```bash
KAFKA_HOME=/opt/module/kafka
```
#### Example5: 群起Kafka
`start-kafka.sh`

#### Example6: 关闭Kafka集群
`stop-kafka.sh`

