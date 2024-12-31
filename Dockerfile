# Base image로 OpenJDK 17을 사용
FROM openjdk:17-jdk-slim

# 작업 디렉터리를 /app으로 설정
WORKDIR /app

# 빌드된 JAR 파일을 컨테이너의 /app 디렉터리에 복사
COPY build/libs/*.jar app.jar

# 애플리케이션을 실행하는 명령
ENTRYPOINT ["java", "-jar", "app.jar"]

# 컨테이너가 실행될 포트를 노출
EXPOSE 8080