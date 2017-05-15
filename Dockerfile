############################################################
# Dockerfile to build webanno container images
# Based on Debian 7
############################################################

################## BEGIN INSTALLATION ######################
# Set the base image to debian
FROM debian:7

# File Author / Maintainer
MAINTAINER Simon Meoni

# Update the repository sources list

## update repository source
RUN apt-get update
RUN apt-get install -y python-software-properties
RUN add-apt-repository -y "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main"

## install dependencies
RUN apt-get update
RUN echo "oracle-java6-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install -y oracle-java6-installer
RUN apt-get install -y subversion
RUN apt-get install -y ant
RUN cd /opt && svn checkout http://svn.code.sf.net/p/gate/code/teamware/trunk gate-code
ADD ./gate/build.properties /opt/gate-code/build.properties
ADD ./gate/entrypoint.sh /entrypoint.sh

##################### INSTALLATION END #####################
EXPOSE 8080
CMD /entrypoint.sh
