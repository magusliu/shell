#/bin/sh

mkdir  ~/changtu/log/rocketmq/mqnamesrv/logs -p
mkdir  ~/changtu/data/rocketmq/mqnamesrv/store -p
mkdir  ~/changtu/log/rocketmq/mqbroker/logs -p
mkdir  ~/changtu/data/rocketmq/mqbroker/store -p

docker run -d -p 9876:9876 -p 10909:10909 -p 10911:10911 -p 10912:10912  -v   ~/changtu/log/rocketmq/mqnamesrv/logs:/opt/mqnamesrv/logs  -v   ~/changtu/log/rocketmq/mqnamesrv/store:/opt/mqnamesrv/store -v   ~/changtu/log/rocketmq/mqbroker/logs:/opt/mqbroker/logs  -v   ~/changtu/log/rocketmq/mqbroker/store:/opt/mqbroker/store --name rocketmq-dev rocketmq-dev:4.1.0


