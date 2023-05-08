FROM /usr/lib/jvm/java-17-openjdk-amd64
VOLUME /tmp
COPY target/*.jar app.jar
CMD java -jar app.jar
