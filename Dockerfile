FROM maven:3-jdk-8 AS builder
RUN cd openmrs-core && mvn clean package
 
FROM tomcat:9
COPY --from=builder /openmrs-core/webapp/target/openmrs.war /usr/local/tomcat/webapps/openmrs.war
EXPOSE 8080
