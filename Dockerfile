FROM tomcat:9
COPY /target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
EXPOSE 8080
