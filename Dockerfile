FROM ubuntu:14.04

MAINTAINER Christoph Wiechert <wio@psitrax.de>
MAINTAINER https://github.com/henszey

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y install python-software-properties git build-essential
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get -y install nodejs

RUN mkdir /app
ADD . /app/

WORKDIR /app
EXPOSE 8000

CMD ["nodejs", "server.js"]
