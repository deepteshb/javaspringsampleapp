# Use the Red Hat UBI 8 Minimal base image
FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

# Install Java 17 runtime (headless is smaller and sufficient for Spring Boot) 
# and clean the package cache to keep the image size small
RUN microdnf update -y \
    && microdnf install -y java-17-openjdk-headless \
    && microdnf clean all

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled JAR file from the Maven build stage
COPY target/*.jar app.jar

# Expose the standard Spring Boot port
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]