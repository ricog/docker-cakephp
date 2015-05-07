#!/bin/bash

chown -R www-data:www-data /var/www

cd /var/www/site
export $APP_ENV
bin/cake Migrations.migration run all

exec "$@"
