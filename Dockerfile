FROM ubuntu:18.04

RUN apt-get -qq update && apt-get -qqy dist-upgrade  2>&1 >/dev/null \
 && apt-get install -qqy --no-install-recommends \
                build-essential zlib1g-dev \
                less nano wget \
                bzip2 unzip xz-utils \
                 2>&1 >/dev/null \
        && rm -rf /var/lib/apt/lists/* 2>&1 >/dev/null

ENV LANG C.UTF-8

WORKDIR /graal

RUN wget --no-check-certificate --quiet -O- https://github.com/oracle/graal/releases/download/vm-1.0.0-rc4/graalvm-ce-1.0.0-rc4-linux-amd64.tar.gz | tar xfz - --strip 1

RUN bin/gu install python

RUN bin/gu rebuild-images polyglot
