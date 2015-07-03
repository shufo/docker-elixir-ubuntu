FROM ubuntu:14.04

MAINTAINER potch8228 pikopiko28@gmail.com

RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN apt-get update && apt-get install -y --no-install-recommends wget curl

RUN wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb -P /root
RUN dpkg -i /root/erlang-solutions_1.0_all.deb
RUN rm /root/erlang-solutions_1.0_all.deb

RUN apt-get update && apt-get install -y --no-install-recommends erlang elixir
