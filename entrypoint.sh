#!/bin/bash
set -u

export JAVA_OPTS="-Djava.awt.headless=true -Xmx1024M -XX:MaxPermSize=256m"

/usr/sbin/dnsmasq
/usr/sbin/tomcat-sysd start
tail -f /var/log/tomcat/catalina.out
