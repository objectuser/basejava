#!/bin/sh
set -x

jdk_url=http://download.oracle.com/otn-pub/java/jdk/8u45-b14
jdk_archive_name=server-jre-8u45-linux-x64.tar.gz
jdk_destination=/usr/lib/jvm/oracle_jdk8

curl -v -j -k -L \
  -H "Cookie: oraclelicense=accept-securebackup-cookie" \
  $jdk_url/$jdk_archive_name > /tmp/build/$jdk_archive_name

mkdir -p /usr/lib/jvm
tar zxf /tmp/build/$jdk_archive_name -C /tmp/build
mv /tmp/build/$jdk_archive/jdk1.8* /usr/lib/jvm/oracle_jdk8

