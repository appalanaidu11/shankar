FROM tomcat:8.0.20-jre8

COPY target/shankar*.war /usr/local/tomcat/webapps/shankar.war