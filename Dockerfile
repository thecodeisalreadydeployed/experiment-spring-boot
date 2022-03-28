FROM openjdk:11
WORKDIR /app
COPY /target/experiment-0.0.1-SNAPSHOT.jar .
ENTRYPOINT ["java", "-jar", "experiment-0.0.1.jar"]
