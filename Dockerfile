FROM openjdk:11
ADD target/springboot-docker.jar springboot-docker.jar
ENTRYPOINT ["java","jar","/springboot-docker.jar"]
EXPOSE 8081