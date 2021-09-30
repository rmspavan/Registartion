# Pull base image 
From tomcat:8-jre8 

# Maintainer 
MAINTAINER "pavan" 
COPY ./register.war /usr/local/tomcat/webapps