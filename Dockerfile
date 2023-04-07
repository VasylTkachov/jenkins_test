FROM openjdk:11-jre-slim

VOLUME /tmp

RUN apt-get update && apt-get install -y --no-install-recommends cron && \
    rm -r /var/lib/apt/lists/*

COPY target/jenkins-0.0.1-SNAPSHOT-exec.jar /app/common.jar

ENTRYPOINT ["java", "-jar", "/app/common.jar"]