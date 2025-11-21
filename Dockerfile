FROM maven:3.9-eclipse-temurin-17-alpine as builder

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jdk-alpine

LABEL maintainer="georgios.avdeliotis.001@student.uni.lu"
LABEL description="Hello World Java application with security scanning"
LABEL version="1.0"

# Create non-root user for security (containers should not run as root)
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY --from=builder --chown=appuser:appgroup /app/target/hello-world.jar ./hello-world.jar

COPY --from=builder --chown=appuser:appgroup /app/target/hello-world-bom.json ./sbom.json

USER appuser

EXPOSE 8080

# Command to run when container starts
ENTRYPOINT ["java", "-jar", "hello-world.jar"]