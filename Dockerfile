############################################################
# Dockerfile to build webanno container images
# Based on Debian 7
############################################################

################## BEGIN INSTALLATION ######################
# Set the base image to debian
FROM debian:whezzy-slim

# File Author / Maintainer
MAINTAINER Simon Meoni

# Update the repository sources list
RUN apt-get update
RUN apt-get install
RUN apt-get install
RUN apt-get install
RUN apt-get install

##################### INSTALLATION END #####################
CMD /entrypoint.sh
