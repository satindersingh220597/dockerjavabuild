FROM gcr.io/distroless/java21-debian12

WORKDIR /app

COPY java-app/target/*.jar java.jar

EXPOSE 8080

CMD ["java.jar"]