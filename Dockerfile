FROM phusion/baseimage:latest

ADD getjdk.sh /tmp/build/getjdk.sh
RUN chmod +x /tmp/build/getjdk.sh
RUN /tmp/build/getjdk.sh

ADD oraclejdk.sh /etc/profile.d/oraclejdk.sh
RUN chmod +x /etc/profile.d/oraclejdk.sh

RUN mkdir -p /home/app/webapp
WORKDIR /home/app/webapp

RUN rm -rf /tmp/build

VOLUME /tmp

CMD ["/sbin/my_init"]

