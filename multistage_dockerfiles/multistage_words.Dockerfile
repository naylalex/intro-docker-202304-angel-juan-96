FROM maven:3.6.3-jdk-14
WORKDIR /backend
COPY . . 
RUN mvn verify

FROM openjdk:14-jdk-alpine
WORKDIR /home/backend
COPY --from=0 /backend/target ./target
CMD [ "java", "-jar", "/home/backend/target/words.jar" ]
EXPOSE 8080