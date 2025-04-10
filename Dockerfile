# Use Maven with Java 21 for building the application
FROM maven:3.9.6-eclipse-temurin-21 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use OpenJDK 21 as the runtime environment
FROM eclipse-temurin:21-jdk AS runtime

ENV JAVA_TOOL_OPTIONS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005"

# Set the working directory for the final image
WORKDIR /app

# Copy the JAR file from the builder stage
COPY --from=builder /app/target/*.jar app.jar

RUN ls /app

# Expose the application port
EXPOSE 8080
EXPOSE 5005

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
