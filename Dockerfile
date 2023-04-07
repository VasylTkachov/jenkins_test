FROM openjdk:11-jre-slim

VOLUME /tmp

USER root
RUN sudo apt-get update

COPY target/jenkins-0.0.1-SNAPSHOT-exec.jar /app/common.jar

ENTRYPOINT ["java", "-jar", "/app/common.jar"]