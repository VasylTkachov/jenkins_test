FROM openjdk:11-jre-slim

VOLUME /tmp

COPY jenkins-0.0.1-SNAPSHOT-exec.jar app.jar

ENTRYPOINT ["java", "-jar", "/app.jar"]