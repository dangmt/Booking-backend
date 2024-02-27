# Sử dụng hình ảnh base Java 11 để build ứng dụng
FROM openjdk:11-jdk-slim as build

# Thiết lập thông tin người duy trì
LABEL maintainer="your_email@example.com"

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Sao chép mã nguồn và tệp cấu hình Maven vào container
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src src

# Thay đổi quyền để mvnw có thể thực thi
RUN chmod +x ./mvnw

# Chạy Maven để build ứng dụng thành một tệp JAR
RUN ./mvnw clean package -DskipTests

# Chọn hình ảnh base mới cho việc chạy ứng dụng
FROM openjdk:11-jre-slim

# Sao chép tệp JAR từ bước build sang bước này
COPY --from=build /app/target/*.jar app.jar

# Mở cổng 8080
EXPOSE 8080

# Định nghĩa lệnh để chạy ứng dụng
ENTRYPOINT ["java","-jar","app.jar"]
