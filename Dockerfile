FROM phusion/baseimage:latest

MAINTAINER Thomas Modeneis (from @soujava)

RUN \
  apt-get update && \
  apt-get install -y \
    libxt-dev zip pkg-config libX11-dev libxext-dev \
    libxrender-dev libxtst-dev libasound2-dev libcups2-dev libfreetype6-dev && \
  rm -rf /var/lib/apt/lists/*

RUN \
  apt-get update

RUN \
  apt-get install -y mercurial ca-certificates-java build-essential
  
RUN \
  cd /tmp && \
  hg clone http://hg.openjdk.java.net/jdk9/jdk9 openjdk9 && \ 
  cd openjdk9 && \
  sh ./get_source.sh 

RUN \
  apt-get install -y wget && \
  wget --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz

RUN \
  tar zxvf jdk-8u45-linux-x64.tar.gz -C /opt 

RUN \
  cd /tmp/openjdk9 && \
  bash ./configure --with-cacerts-file=/etc/ssl/certs/java/cacerts --with-boot-jdk=/opt/jdk1.8.0_45

RUN \  
  cd /tmp/openjdk9 && \
  make clean images

RUN \  
  cd /tmp/openjdk9 && \
  cp -a build/linux-x86_64-normal-server-release/images/jdk \
    /opt/openjdk9 

RUN \  
  cd /tmp/openjdk9 && \
  find /opt/openjdk9 -type f -exec chmod a+r {} + && \
  find /opt/openjdk9 -type d -exec chmod a+rx {} +

ENV PATH /opt/openjdk9/bin:$PATH
ENV JAVA_HOME /opt/openjdk9

#install git
RUN \
  apt-get install git -y --force-yes

#download maven
RUN \
  sudo apt-get install maven -y --force-yes
