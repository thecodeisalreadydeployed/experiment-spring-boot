FROM maven:3.8.4-jdk-11-slim as build-env
COPY src /app/src
COPY pom.xml /app
RUN mvn -f /app/pom.xml clean package

FROM openjdk:11-jre-slim
COPY --from=build-env /app/target/experiment-0.0.1-SNAPSHOT.jar .
ENV PORT ${PORT}
EXPOSE ${PORT}
CMD java -jar experiment-0.0.1-SNAPSHOT.jar --server.port=${PORT}

