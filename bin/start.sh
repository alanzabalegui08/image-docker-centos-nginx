#!/bin/bash

#start php process in background 
 
/usr/sbin/php-fpm -c /etc/php/fpm

#start ngionx daemon

nginx -g 'daemon off;'

