# ------------------------------------------------------
#                       Dockerfile
# ------------------------------------------------------
# image:    docker-ddg-hack
# tag:      latest
# name:     amuxbit/docker-ddg-hack
# version:  1.0.0
# repo:     https://github.com/amuxbit/docker-ddg-hack
# how-to:   docker build --force-rm -t amuxbit/docker-ddg-hack .
# run:      docker run -t -i amuxbit/docker-ddg-hack"
# requires: ubuntu
# authors:  jason.giedymin@gmail.com
# ------------------------------------------------------

FROM amuxbit/docker-perl:latest
MAINTAINER amuxbit

# -----> Env
ENV WORKDIR /tmp/build/docker-perl
WORKDIR /tmp/build/docker-perl

# -----> Add assets
ADD ./ubuntu $WORKDIR/ubuntu

# -----> Prepare
RUN chmod +x $WORKDIR/ubuntu

# -----> Lib
# RUN git clone https://github.com/Amuxbit/container-automation-lib.git lib
RUN cd lib && git pull origin master

# -----> Execute
RUN $WORKDIR/ubuntu

# -----> Cleanup
WORKDIR /
