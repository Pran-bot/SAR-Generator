FROM eclipse-temurin:25-jre

WORKDIR /app

ENV DB_URL=jdbc:postgresql://host.docker.internal:5432/SAR_Generator

COPY target/main_service-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT [ "java" , "-jar" ,"app.jar" ]