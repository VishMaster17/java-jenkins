FROM openjdk:17-slim

COPY target/java-jenkins.jar /app/

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app/java-jenkins.jar"]

