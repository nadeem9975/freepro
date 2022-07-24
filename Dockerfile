FROM  centos:latest
MAINTAINER nadeem
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install -y httpd \
 zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-layouts/download/page1/css-layout-10.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip css-layout-10.zip
RUN cp -rvf layout10/* .
RUN rm -rf layout10 css-layout-10.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
