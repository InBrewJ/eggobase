FROM tomcat:8.5-alpine
LABEL maintainer="jason@urawizard.com"

# Java Mail
ADD jars/dsn.jar /usr/local/tomcat/lib
ADD jars/imap.jar /usr/local/tomcat/lib  
ADD jars/mailapi.jar /usr/local/tomcat/lib 
ADD jars/pop3.jar /usr/local/tomcat/lib  
ADD jars/smtp.jar /usr/local/tomcat/lib

# JSTL
ADD jars/jstl-1.2.jar /usr/local/tomcat/lib

# Postgres
ADD jars/postgresql-42.2.12.jar /usr/local/tomcat/lib

# Tomcat context for this app (includes to JNDI connection details for postgres!)
ADD context.xml /usr/local/tomcat/conf

# Add the build
ADD ./builder/out/Eggobase.war /usr/local/tomcat/webapps/

# Environment
ADD ash-set-env.sh /usr/local/tomcat/bin
ADD docker-start.sh /usr/local/tomcat/bin

EXPOSE 8080
CMD ["docker-start.sh"]