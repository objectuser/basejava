# basejava
A base image for Java apps.

This image is based on [phusion/baseimage](https://github.com/phusion/baseimage-docker).

The way I use it is to add my app to the image and an init script to run the app.

First, in the Dockerfile, I put something like this:

```
FROM objectuser/basejava:latest

ADD files/boot-hello.jar /home/app/webapp/boot-hello.jar

# Start the app as an init process
RUN mkdir -p /etc/my_init.d
ADD files/0-app.sh /etc/my_init.d/0-app.sh
RUN chmod +x /etc/my_init.d/0-app.sh
```

Read the documentation on phusion/baseimage for how the init process works.

The `0-app.sh` file might be like this:

```
#!/bin/sh
java -jar boot-hello.jar
```

# How It Works

Oracle Java is installed as a package. The `/etc/environment` file is replaced with:

```
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/jvm/oracle_jdk8/bin"
JAVA_HOME="/usr/lib/jvm/oracle_jdk8"
```
