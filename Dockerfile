FROM ubuntu:latest
MAINTAINER Kamil Awid <kamil.awid@gmail.com>
RUN apt-get update
RUN apt-get -y upgrade
 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2 libapache2-mod-php5  php5-curl curl lynx-cur php5-mysql php5-gd php-pear php-apc

RUN a2enmod php5
RUN a2enmod rewrite
 
RUN sed -i "s/display_errors = Off/display_errors = On/" /etc/php5/apache2/php.ini
RUN sed -i "s/short_open_tag = Off/short_open_tag = On/" /etc/php5/apache2/php.ini
RUN sed -i "s/error_reporting = .*$/error_reporting = E_ALL/" /etc/php5/apache2/php.ini

ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80
 
# Volume for your data
VOLUME ["/data"]

#start apache
CMD /usr/sbin/apache2ctl -D FOREGROUND