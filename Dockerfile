FROM maven:3-eclipse-temurin-17 as build

COPY . /app
WORKDIR /app
RUN mvn package -DskipTests
RUN mv target/*.jar target/app.jar

FROM eclipse-temurin:17-jdk
COPY --from=build /app/target/app.jar /app/app.jar
CMD ["java", "-jar", "/app/app.jar"]
