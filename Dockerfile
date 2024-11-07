# Use an official Tomcat image as the base
FROM tomcat:9.0-jdk17

# Copy the WAR file into the webapps directory of Tomcat
COPY target/hello-world-app.war /usr/local/tomcat/webapps/hello-world-app.war

# Expose the Tomcat default port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
