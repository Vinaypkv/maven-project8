FROM adoptopenjdk/java-1.11.0-openjdk-amd64
VOLUME /tmp
COPY target/*.jar app.jar
CMD java -jar app.jar
