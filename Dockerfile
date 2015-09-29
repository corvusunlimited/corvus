FROM airdock/oracle-jdk:1.8

ENV MB_JETTY_HOST 0.0.0.0
ENV MB_JETTY_PORT 3000
ENV DB_FILE_NAME /app/files/corvus

VOLUME ["/app/files"]

EXPOSE 3000

RUN apt-get update && \
    apt-get install -y openjdk-7-jre

ADD ./corvus.jar /app/
ENTRYPOINT ["java", "-Dlogfile.path=target/log", "-XX:+CMSClassUnloadingEnabled", "-XX:+UseConcMarkSweepGC", "-jar", "/app/corvus.jar"]
