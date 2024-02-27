# Giai đoạn 1: Xây dựng ứng dụng sử dụng Maven
FROM maven:3.8.6-jdk-17-slim AS MAVEN_TOOL_CHAIN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

# Giai đoạn 2: Chạy ứng dụng sử dụng openjdk
FROM openjdk:8-jdk-alpine
COPY --from=MAVEN_TOOL_CHAIN /tmp/target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
