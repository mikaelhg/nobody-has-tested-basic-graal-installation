# Nobody has tested basic Graal installation

```text
$ docker build --rm -t graal-installation .
Sending build context to Docker daemon  55.81kB
Step 1/7 : FROM ubuntu:18.04
 ---> 74f8760a2a8b
Step 2/7 : RUN apt-get -qq update && apt-get -qqy dist-upgrade  2>&1 >/dev/null  && apt-get install -qqy --no-install-recommends                 build-essential zlib1g-dev                 less nano wget                 bzip2 unzip xz-utils                  2>&1 >/dev/null         && rm -rf /var/lib/apt/lists/* 2>&1 >/dev/null
 ---> Running in d6b6126480d2
debconf: delaying package configuration, since apt-utils is not installed
debconf: delaying package configuration, since apt-utils is not installed
Removing intermediate container d6b6126480d2
 ---> bed5006e31da
Step 3/7 : ENV LANG C.UTF-8
 ---> Running in 57130406c6e0
Removing intermediate container 57130406c6e0
 ---> 84db4ad9d95d
Step 4/7 : WORKDIR /graal
 ---> Running in 438bd2dfc343
Removing intermediate container 438bd2dfc343
 ---> e061dfe5bdee
Step 5/7 : RUN wget --no-check-certificate --quiet -O- https://github.com/oracle/graal/releases/download/vm-1.0.0-rc4/graalvm-ce-1.0.0-rc4-linux-amd64.tar.gz | tar xfz - --strip 1
 ---> Running in 377d52247149
Removing intermediate container 377d52247149
 ---> fbceb4ebb500
Step 6/7 : RUN bin/gu install python
 ---> Running in 78c0b49ce4f8
Downloading: Component catalog
Processing component archive: Component python
Downloading: Component python
Installing new component: Graal.Python (org.graalvm.python, version 1.0.0-rc4)

IMPORTANT NOTE:
---------------
Set of Graal VM components that provide language implementations have changed. The Polyglot native image and polyglot native C library may be out of sync: 
- new languages may not be accessible
- removed languages may cause the native binary to fail on missing resources or libraries.
To rebuild and refresh the native binaries, use the following command:
        /graal/jre/bin/gu rebuild-images


Removing intermediate container 78c0b49ce4f8
 ---> 303b0afe5e0c
Step 7/7 : RUN bin/gu rebuild-images polyglot
 ---> Running in c44218fceb90
Building polyglot...
   classlist:   3,255.61 ms
       (cap):   1,077.35 ms
       setup:   3,360.95 ms
GraalVM 1.0.0-rc4 warning: INFO: os::commit_memory(0x0000000523180000, 2804416512, 0) failed; error='Cannot allocate memory' (errno=12)
#
# There is insufficient memory for the Java Runtime Environment to continue.
# Native memory allocation (mmap) failed to map 2804416512 bytes for committing reserved memory.
# An error report file with more information is saved as:
# /graal/hs_err_pid47.log
Error: Image building with exit status 1
The command '/bin/sh -c bin/gu rebuild-images polyglot' returned a non-zero code: 1

```
