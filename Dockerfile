# Bước 1: Xây dựng ứng dụng Spring Boot sử dụng maven
FROM maven:4.0-openjdk-17 AS build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

# Bước 2: Chạy ứng dụng sử dụng JRE
FROM openjdk:17
COPY --from=build /home/app/target/*.jar /usr/local/lib/spring-boot-app.jar
EXPOSE 9192
ENTRYPOINT ["java","-jar","/usr/local/lib/spring-boot-app.jar"]

