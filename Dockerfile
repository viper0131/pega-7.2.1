FROM pegasystems/pega7-tomcat-ready

# Expand prweb to target directory
COPY pega-sources/archives/prweb.war /opt/pega/prweb.war
RUN unzip -q -d /opt/pega/prweb /opt/pega/prweb.war

# Expand pr sys managment to target directory
COPY pega-sources/archives/prsysmgmt.war /opt/pega/prsysmgmt.war
RUN unzip -q -d /opt/pega/prsysmgmt /opt/pega/prsysmgmt.war

# Make jdbc driver available to tomcat applications
COPY jdbc-sources/postgresql-9.4.1209.jre7.jar /usr/local/tomcat/lib/

# Make scripts available
COPY pega-sources/scripts/ /opt/pega/scripts/
