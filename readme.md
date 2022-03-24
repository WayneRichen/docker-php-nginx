# About This Image

This image is integrated by Wayne Richen, and it integrates PHP-FPM and Nginx, allowing you to build php and nginx with just one image.

# How to Use It?

### Use docker-compose

To use it in docker-compose, create a `docker-compose.yml` file with the following contents and your application will be mounted in the container at /var/www/html.

```
services:
  php:
    container_name: php
    image: waynerichen/php-nginx:tag-name
    ports:
        - 80:80
    volumes:
        - ./html:/var/www/html
    restart: always
```

### Use Dockerfile

To use it in Dockerfile, create a `Dockerfile` with the following contents.

```
FROM waynerichen/php-nginx:tag-name
COPY . /var/www/html
```

# What's in the Image?

This image contains following programs and extensions.

**Programs:**

- PHP-FPM (The version you choose)
- Nginx
- composer 2.X
- cron
- git
- postfix
- vim
- wget
- zip

**PHP modules**

- bcmath
- Core
- ctype
- curl
- date
- dom
- fileinfo
- filter
- ftp
- gd
- hash
- iconv
- intl
- json
- libxml
- mbstring
- mysqlnd
- openssl
- pcre
- PDO
- pdo_mysql
- pdo_sqlite
- Phar
- posix
- readline
- Reflection
- session
- SimpleXML
- soap
- sockets
- sodium
- SPL
- sqlite3
- standard
- tokenizer
- xml
- xmlreader
- xmlwriter
- xsl
- Zend OPcache
- zip
- zlib
