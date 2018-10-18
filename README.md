# ClusterAutomatic
This project provides pyhon and bash scripts to automate clusters

该项目提供python和bash脚本,用于自动化集群启动和配置。

- [x] xcall脚本,集群间同步执行命令
- [x] zookeeper集群启动和关闭功能
- [x] kafka集群启动和关闭功能
- [ ] zookeeper自动化配置
- [ ] kafka自动化配置
- [ ] hadoop自动化配置

# 使用方式

### 前提
将以下文件都添加到PATH环境变量中.

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

## 二.zookeeper群起
#### 配置zks.conf

添加zookeeper安装位置
```bash
# configure zookeeper home in here
ZK_HOME=/opt/module/zookeeper-3.4.10
```
#### Example3： 群起zookeeper
`start-zks.sh`

#### Example4: 关闭zookeeper集群
`stop-zks.sh`

## 三.kafka群起
#### 配置kafka.conf

添加kafka安装配置
```bash
KAFKA_HOME=/opt/module/kafka
```
#### Example5: 群起Kafka
`start-kafka.sh`

#### Example6: 关闭Kafka集群
`stop-kafka.sh`

