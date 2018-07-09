FROM ubuntu:17.10

LABEL Description="gitbucket"

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update \
   && apt-get -y upgrade && apt-get -y install ntp software-properties-common \
   && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
   && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
   && add-apt-repository -y ppa:webupd8team/java

RUN apt-get update

# install java
RUN apt-get install -y oracle-java8-installer
RUN apt-get install -y oracle-java8-set-default

# setup timezone
# RUN apt-get install -y tzdata
# RUN echo Asia/Seoul | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

## install extra package
RUN apt-get install -y unzip

## remove cache
RUN rm -rf /var/cache/oracle-jdk8-installer && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tank/war
RUN mkdir -p /tank/data_dir

# RUN wget -P /tank/war https://github.com/gitbucket/gitbucket/releases/download/4.25.0/gitbucket.war
RUN wget -P /tank/war https://github.com/gitbucket/gitbucket/releases/download/4.26.0/gitbucket.war

COPY ./bootstrap.sh /tank/bootstrap.sh
RUN chmod a+x /tank/bootstrap.sh
CMD ["/bin/sh","-c","/tank/bootstrap.sh"]