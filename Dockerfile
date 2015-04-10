FROM ubuntu:trusty
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN apt-get update && \
    apt-get install -y openjdk-7-jre

ADD ./corvus.jar /app/
EXPOSE 3000
ENTRYPOINT ["java", "-Dlogfile.path=target/log", "-XX:+CMSClassUnloadingEnabled", "-XX:+UseConcMarkSweepGC", "-jar", "/app/corvus.jar"]
