FROM debian:stretch
MAINTAINER Jacopo Mauro

RUN apt-get update && \
	apt-get install -y \
		openjdk-8-jre-headless \
 		wget \
 		unzip && \
	rm -rf /var/lib/apt/lists/* && \
  mkdir -p /tool && \
	cd /tool && \
	wget https://github.com/informarte/yuck/releases/download/20200306/yuck-20200306.zip && \
	unzip yuck-20200306.zip && \
	rm yuck-20200306.zip && \
	mv yuck-20200306 yuck && \
	cd yuck && \
	ln -s bin/yuck fzn-yuck && \
	mv mzn/lib mzn-lib
	
ENV PATH "$PATH:/tool/yuck/"

# minizinc lib files in /tool/yuck/mzn-lib
# fzn-exec is /tool/yuck/fzn-yuck
