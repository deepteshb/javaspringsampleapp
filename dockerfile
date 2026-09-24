# Use the Red Hat UBI 8 Minimal base image
FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

# Accept the Java version argument passed from the Jenkins matrix (defaults to 17)
ARG JAVA_VERSION=17

# Dynamically install the correct Java runtime version and clean the cache
RUN microdnf update -y \
    && microdnf install -y java-${JAVA_VERSION}-openjdk-headless \
    && microdnf clean all

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled JAR file from the Maven build stage
COPY target/*.jar app.jar

# Expose the standard Spring Boot port
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]