FROM centos:7

LABEL description="Version 1.0.0"

COPY  nginx.repo /etc/yum.repos.d/nginx.repo


RUN \
    yum -y install nginx  --enablerepo=nginx  && \
    yum -y install https://centos7.iuscommunity.org/ius-release.rpm && \
    yum -y install \ 
    php71u-fpm \
    php71u-cli \
    php71u-mysqlnd \
    php71u-soap \
    php71u-xml \
    php71u-zip \
    php71u-json \
    php71u-mcrypt \
    php71u-mbstring \
    php71u-gd \
    --enablerepo=ius && yum clean all  

EXPOSE 80 443

VOLUME  /var/www/html /var/log/nginx var/log/php-fpm /var/lib/php-fpm 

COPY  nginx.conf /etc/nginx/conf.d/default.conf                 

COPY ./bin/start.sh  /start.sh 

COPY index.php /var/www/html/index.php

RUN chmod +x /start.sh 

CMD /start.sh

