FROM buildpack-deps:jessie-curl

# Download and install Java
COPY getjdk.sh /tmp/build/getjdk.sh
RUN chmod +x /tmp/build/getjdk.sh
RUN /tmp/build/getjdk.sh

# Cleanup
RUN rm -rf /tmp/build

VOLUME /tmp

