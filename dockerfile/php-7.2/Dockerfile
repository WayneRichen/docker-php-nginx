FROM php:7.2-fpm-buster

ENV DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && apt-get install -y \
    cron \
    git \
    libcurl4-openssl-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxml2-dev \
    libxslt-dev \
    libzip-dev \
    lsof \
    mariadb-client \
    nginx \
    postfix \
    vim \
    wget \
    zip \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://getcomposer.org/download/latest-2.x/composer.phar -O /usr/local/bin/composer && chmod +x /usr/local/bin/composer \
    && docker-php-ext-install bcmath \
    && docker-php-ext-configure gd --with-freetype-dir --with-jpeg-dir \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install intl \
    && docker-php-ext-enable opcache \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install soap \
    && docker-php-ext-install sockets \
    && docker-php-ext-install xsl \
    && docker-php-ext-install zip \
    && docker-php-ext-install mysqli \
    && echo "alias ll='ls -alhp --color=auto'\nalias grep='grep --color=auto'\nalias vi='vim'" >> /root/.bashrc \
    && echo "[global] \ndaemonize = no \n\n[www] \nlisten = /run/php7.2-fpm.sock \nlisten.mode = 0666" > /usr/local/etc/php-fpm.d/zz-docker.conf \
    && echo "upload_max_filesize = 64M \npost_max_size = 64M \nmax_execution_time = 600 \nmax_file_uploads = 100" >  /usr/local/etc/php/conf.d/uploads.ini \
    && sed -i 's/www-data/1000/;' /usr/local/etc/php-fpm.d/www.conf \
    && echo "#!/bin/bash\nservice nginx start\n/usr/sbin/cron\nservice postfix start\nphp-fpm" > /entry.sh \
    && sed -i 's/index.html/index.php index.html/;s/#location\s~\s\\.php\$\s{/location ~ \.php$ {/;s/#\sinclude snippets\/fastcgi-php.conf;/        include snippets\/fastcgi-php.conf;/;s/#\sfastcgi_pass\sunix:\/run\/php\/php7.3-fpm.sock;/        fastcgi_pass unix:\/run\/php7.2-fpm.sock;/;0,/#}/s//}/' /etc/nginx/sites-available/default \
    && sed -i 's/types_hash_max_size 2048;/types_hash_max_size 2048;\n        client_max_body_size 64M;/;' /etc/nginx/nginx.conf \
    && nginx -t

RUN chmod +x /entry.sh

ENTRYPOINT ["/bin/bash", "/entry.sh"]

EXPOSE 80