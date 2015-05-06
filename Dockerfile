FROM ricog/php-fpm
MAINTAINER Rick Guyer <ricoguyer@gmail.com>

RUN apt-get update && apt-get install -y php5-intl php5-cli git curl
RUN sed -i '/upload_max_filesize /c upload_max_filesize = 20M' /etc/php5/fpm/php.ini
RUN sed -i '/post_max_size /c post_max_size = 20M' /etc/php5/fpm/php.ini
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php5-fpm"]
