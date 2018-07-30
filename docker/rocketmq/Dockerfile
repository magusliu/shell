FROM openjdk:8-alpine

ENV ROCKETMQ_HOME  /opt/rocketmq
ENV ROCKETMQ_VERSION = 4.1.0-incubating
WORKDIR  ${ROCKETMQ_HOME}

RUN mkdir -p \
                /opt/mqnamesrv/logs \
            /opt/mqnamesrv/store \
                  -p \
                /opt/mqbroker/logs \
            /opt/mqbroker/store

RUN wget https://dist.apache.org/repos/dist/release/rocketmq/4.1.0-incubating/rocketmq-all-4.1.0-incubating-bin-release.zip &&  unzip rocketmq-all-4.1.0-incubating-bin-release.zip \
          && mv rocketmq-all*/* . \
          && rm -rf rocketmq-all*  \
          && rm -f rocketmq-all-4.1.0-incubating-bin-release.zip
RUN sed -i s/"-server -Xms8g -Xmx8g -Xmn4g"/"-server  -Xms128m -Xmx1g"/g  bin/runbroker.sh &&  sed -i s/"-server -Xms4g -Xmx4g -Xmn2g"/"-server   -Xms256m -Xmx1g"/g  bin/runserver.sh

RUN echo -e '#!/bin/sh \nexport JAVA_OPT=" -Duser.home=/opt/mqnamesrv" \nnohup sh mqnamesrv  >> /tmp/namesrv.out ' > bin/docker_namesrv.sh
RUN echo -e '#!/bin/sh \nexport JAVA_OPT=" -Duser.home=/opt/mqbroker" \nnohup sh mqbroker -n 127.0.0.1:9876 >> /tmp/broker.out ' > bin/docker_broker.sh

RUN chmod +x bin/mqbroker && chmod +x bin/mqnamesrv && chmod a+x bin/docker*.sh

CMD cd /opt/rocketmq/bin && ./docker_namesrv.sh && ./docker_broker.sh && top

VOLUME  /opt/mqnamesrv/logs \
	/opt/mqnamesrv/store \
	/opt/mqbroker/logs \
	/opt/mqbroker/store

EXPOSE 9876 10909 10911 10912
