FROM ricog/php-fpm:0.2
MAINTAINER Rick Guyer <ricoguyer@gmail.com>

# Install required server packages
#
# curl          - CakePHP ??
# git           - To install from a remote git repo
# php5-cli      - CakePHP 2 and 3
# php5-intl     - CakePHP 3
# php5-xsl      - CakePHP 2
# php5-readline - CakePHP 3 - required by boris shell
#
RUN apt-get update && apt-get install -y php5-intl php5-cli php5-xsl php5-readline git curl
RUN sed -i '/upload_max_filesize /c upload_max_filesize = 20M' /etc/php5/fpm/php.ini
RUN sed -i '/post_max_size /c post_max_size = 20M' /etc/php5/fpm/php.ini
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN usermod -u 1000 www-data

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php5-fpm"]
