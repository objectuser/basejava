FROM phusion/baseimage:latest

# Download and install Java
ADD getjdk.sh /tmp/build/getjdk.sh
RUN chmod +x /tmp/build/getjdk.sh
RUN /tmp/build/getjdk.sh

# Add Java to the environment
ADD oraclejdk.sh /etc/profile.d/oraclejdk.sh
RUN chmod +x /etc/profile.d/oraclejdk.sh

# Cleanup
RUN rm -rf /tmp/build

VOLUME /tmp

CMD ["/sbin/my_init"]

