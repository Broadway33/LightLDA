FROM ubuntu

ARG WGET=wget
ARG GIT=git
ARG ZMQ=libzmq3-dev
ARG BE=build-essential
ARG PYTHON=python2.7
ARG PIP=python-pip

RUN apt-get update \
     && apt-get install -y \
	    "$WGET" \
	    "$GIT" \
	    "$BE" \
	    "$ZMQ" \
	    "$PYTHON" \
	    "$PIP" \
    && apt-get clean -y

RUN $GIT clone https://github.com/Broadway33/LightLDA

WORKDIR /LightLDA
RUN bash build.sh

WORKDIR /LightLDA/example/
RUN bash nytimes.sh
