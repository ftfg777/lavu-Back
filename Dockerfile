FROM gradle:8.11.1-jdk17

# 작업 디렉터리 생성
WORKDIR /app

## Gradle 빌드 도구 설치 (필요한 경우)
#RUN apt-get update && apt-get install -y wget unzip \
#    && wget https://services.gradle.org/distributions/gradle-7.5-bin.zip \
#    && unzip gradle-7.5-bin.zip -d /opt \
#    && ln -s /opt/gradle-7.5/bin/gradle /usr/bin/gradle

# 프로젝트 파일들을 컨테이너에 복사
COPY . /app

# Gradle 빌드 수행 (JAR 파일 생성)
RUN ./gradlew build

# 빌드된 JAR 파일을 컨테이너의 /app 디렉터리에 복사
COPY build/libs/*.jar app.jar

# 애플리케이션을 실행하는 명령
CMD ["java", "-jar", "app.jar"]