# Use official Java 21 JDK image
FROM eclipse-temurin:21-jdk-alpine

# Set working directory
WORKDIR /app

# Copy Gradle wrapper and project files
COPY gradlew .
COPY gradle ./gradle
COPY build.gradle .
COPY settings.gradle .
COPY src ./src

# Make gradlew executable
RUN chmod +x gradlew

# Build the WAR inside Docker
RUN ./gradlew clean build

# Expose port (Render will override $PORT)
EXPOSE 8080

# Run the Spring Boot WAR
CMD ["java", "-jar", "build/libs/test_java.war"]
