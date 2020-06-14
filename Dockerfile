FROM tomcat:8.5-alpine
LABEL maintainer="jason@urawizard.com"

# Java Mail
ADD dsn.jar /usr/local/tomcat/lib
ADD imap.jar /usr/local/tomcat/lib  
ADD mailapi.jar /usr/local/tomcat/lib 
ADD pop3.jar /usr/local/tomcat/lib  
ADD smtp.jar /usr/local/tomcat/lib

# JSTL
ADD jstl-1.2.jar /usr/local/tomcat/lib

# Postgres
ADD postgresql-42.2.12.jar /usr/local/tomcat/lib

# Tomcat context for this app (includes to JNDI connection details for postgres!)
ADD context.xml /usr/local/tomcat/conf

# Add the build
ADD Eggobase.war /usr/local/tomcat/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]