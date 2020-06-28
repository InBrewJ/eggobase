FROM tomcat:8.5

WORKDIR /opt/
RUN mkdir /opt/out

ADD jars /opt/jars
ADD src /opt/src
ADD WebContent /opt/WebContent

COPY build-w-javac.sh /opt/build-w-javac.sh

RUN apt-get update
RUN apt-get install default-jre --assume-yes
RUN apt-get install default-jdk --assume-yes
RUN apt-get install zip --assume-yes

ENTRYPOINT ["/opt/build-w-javac.sh"]