FROM centos:7

RUN yum install -y dnsmasq unzip tomcat java-1.7.0-openjdk-devel
RUN yum update -y && yum clean all


# 内部から自身のホスト名の名前解決をするため、dnsmasqを使用する
RUN echo 'address="/openam.example.com/127.0.0.1"' >> /etc/dnsmasq.d/0hosts
RUN echo 'listen-address=127.0.0.1' >> /etc/dnsmasq.conf
RUN echo 'resolv-file=/etc/resolv.dnsmasq.conf' >> /etc/dnsmasq.conf
RUN echo 'conf-dir=/etc/dnsmasq.d' >> /etc/dnsmasq.conf
RUN echo 'user=root' >> /etc/dnsmasq.conf


RUN echo 'nameserver 8.8.8.8' >> /etc/resolv.dnsmasq.conf
RUN echo 'nameserver 8.8.4.4' >> /etc/resolv.dnsmasq.conf

# Install OpenAM
RUN curl -sS http://maven.forgerock.org/repo/releases/org/forgerock/openam/openam-distribution-kit/12.0.0/openam-distribution-kit-12.0.0.zip > /tmp/openam.zip
RUN unzip /tmp/openam.zip
RUN cp /openam/OpenAM-12.0.0.war /var/lib/tomcat/webapps/openam.war


# entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

# port
EXPOSE 8080
