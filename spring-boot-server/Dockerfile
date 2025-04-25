FROM --platform=linux/amd64 maven:3.8.6-eclipse-temurin-17

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean install -DskipTests

EXPOSE 8080

CMD ["mvn", "spring-boot:run"]