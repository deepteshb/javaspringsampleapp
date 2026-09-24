# Use a lightweight JRE base image (matching the Java 17 used in the build stage)
FROM eclipse-temurin:17-jre-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled JAR file from the Maven build stage
# The wildcard ensures it catches the JAR regardless of its exact version number
COPY target/*.jar app.jar

# Expose the standard Spring Boot port
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]