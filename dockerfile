# Use a lightweight base image
FROM alpine:latest

# Set a working directory
WORKDIR /app

# Run a simple command to verify the build process is working
RUN echo "Hello from the Jenkins pipeline build!" > test-file.txt

# Set a default command (optional, but good practice)
CMD ["cat", "test-file.txt"]