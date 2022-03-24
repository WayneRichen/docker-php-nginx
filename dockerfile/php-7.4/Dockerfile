FROM php:7.4-fpm-buster

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
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install intl \
    && docker-php-ext-enable opcache \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install soap \
    && docker-php-ext-install sockets \
    && docker-php-ext-install xsl \
    && docker-php-ext-install zip \
    && echo "alias ll='ls -alhp --color=auto'\nalias grep='grep --color=auto'\nalias vi='vim'" >> /root/.bashrc \
    && echo "[global] \ndaemonize = no \n\n[www] \nlisten = /run/php7.4-fpm.sock \nlisten.mode = 0666" > /usr/local/etc/php-fpm.d/zz-docker.conf

COPY /nginx/default /etc/nginx/sites-available

COPY /entry.sh /entry.sh

RUN chmod +x /entry.sh

ENTRYPOINT ["/bin/bash", "/entry.sh"]

EXPOSE 80