# Sử dụng một base image chứa Java Runtime Environment (JRE)
FROM openjdk:17-jre-slim as builder

# Thiết lập thư mục làm việc trong container
WORKDIR application

# Sao chép mã nguồn và file cấu hình vào thư mục làm việc
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

# Xây dựng ứng dụng bằng Maven Wrapper
RUN ./mvnw clean package

# Gỡ bỏ các phụ thuộc không cần thiết, chỉ giữ lại file jar
RUN java -Djarmode=layertools -jar target/*.jar extract

# Tạo một image mới không chứa môi trường xây dựng
FROM openjdk:17-jre-slim

WORKDIR application

COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/application/ ./

# Chỉ định lệnh để chạy ứng dụng
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]
