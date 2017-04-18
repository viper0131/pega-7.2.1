FROM pegasystems/pega7-tomcat-ready

LABEL io.openshift.wants pegadb
LABEL io.k8s.description Pega Systems 7.2.1
LABEL io.openshift.expose-services 2020/udp:ftp,8080:https
LABEL io.openshift.non-scalable     false
LABEL io.openshift.min-memory 4Gi
LABEL io.openshift.min-cpu     2




# Expand prweb to target directory
COPY pega-sources/archives/prweb.war /opt/pega/prweb.war
RUN unzip -q -d /opt/pega/prweb /opt/pega/prweb.war

# Expand pr sys managment to target directory
COPY pega-sources/archives/prsysmgmt.war /opt/pega/prsysmgmt.war
RUN unzip -q -d /opt/pega/prsysmgmt /opt/pega/prsysmgmt.war

# Make jdbc driver available to tomcat applications
#ADD https://jdbc.postgresql.org/download/postgresql-9.4.1209.jre7.jar /usr/local/tomcat/lib/postgresql-9.4.1209.jre7.jar
ADD jdbc-sources/postgresql-9.4.1209.jre7.jar /usr/local/tomcat/lib/postgresql-9.4.1209.jre7.jar

# Make scripts available
COPY pega-sources/scripts/ /opt/pega/scripts/
