FROM maven:3.8.4-jdk-11-slim as build-env
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache
COPY . .
RUN mvn clean install

FROM openjdk:11
COPY --from=build-env /target/experiment-0.0.1-SNAPSHOT.jar .
ENV PORT ${PORT}
EXPOSE ${PORT}
CMD java -jar experiment-0.0.1-SNAPSHOT.jar --server.port=${PORT}

