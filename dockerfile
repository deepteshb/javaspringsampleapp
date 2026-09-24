# Use the Ubuntu-based JRE image which supports ARM64/Apple Silicon
FROM eclipse-temurin:17-jre-jammy

WORKDIR /app

# Copy the compiled JAR file from the Maven build stage
COPY target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]