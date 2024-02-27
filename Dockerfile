# Sử dụng hình ảnh Maven chính thức để xây dựng ứng dụng trong giai đoạn build
FROM maven:3.8.4-openjdk-11-slim as build
WORKDIR /app
COPY src ./src
COPY pom.xml .
# Cài đặt các phụ thuộc và xây dựng dự án (không tạo ra file .jar)
RUN mvn install

# Sử dụng OpenJDK để chạy ứng dụng
FROM openjdk:11-jre-slim
COPY --from=build /app/target /app
WORKDIR /app
# Chạy ứng dụng từ mã nguồn đã được biên dịch
CMD ["java", "org.springframework.boot.loader.JarLauncher"]
