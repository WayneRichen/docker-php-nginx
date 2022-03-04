#!/bin/bash
service nginx start
/usr/sbin/cron
service postfix start
php-fpm