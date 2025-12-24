FROM infotechsoft/maven:3-jdk-25 AS build
ENV JAVA_HOME="/usr/lib/jvm/temurin-25-jdk"
WORKDIR /
COPY pom.xml .
COPY /src /src
COPY .env.example .env
RUN mvn clean install -DskipTests

FROM openjdk:25-ea-jdk-slim AS zoo-application
COPY --from=build /target/animals-1.0.0-SNAPSHOT.jar application.jar
COPY .env.example .env
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "application.jar"]