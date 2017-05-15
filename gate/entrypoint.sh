#!/bin/bash
while [[ `mysql --user=root --password=$PASSWORD --host=$SQLHOST -e "SHOW DATABASES" 2> ./log | more ./log` =~ "ERROR" ]]
do
  sleep 6 | echo "wait db ..."
done
sed -i s/$\{PASSWORD\}/$PASSWORD/g /opt/gate-code/build.properties
sed -i s/$\{SQLHOST\}/$SQLHOST/g /opt/gate-code/build.properties
cd /opt/gate-code/ && ant install
./tomcat6/bin/catalina.sh start
tail -F /opt/gate-code/tomcat6/logs/*
