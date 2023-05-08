FROM openjdk:17-oracle
VOLUME /tmp
COPY target/*.jar app.jar
CMD java -jar app.jar
