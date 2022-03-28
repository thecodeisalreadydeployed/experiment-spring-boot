FROM maven:3.8.4-jdk-11-slim as build-env
COPY . .
RUN mvn clean install

FROM openjdk:11
COPY --from=build-env /target/experiment-0.0.1-SNAPSHOT.jar .
ENV PORT ${PORT}
EXPOSE ${PORT}
CMD java -jar experiment-0.0.1-SNAPSHOT.jar --server.port=${PORT}

#FROM openjdk:11
#WORKDIR /app
#COPY /experiment-0.0.1-SNAPSHOT.jar .
#CMD java -jar experiment-0.0.1.jar
