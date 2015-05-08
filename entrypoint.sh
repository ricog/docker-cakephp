#!/bin/bash

cd /var/www/site
export $APP_ENV
bin/cake Migrations.migration run all

exec "$@"
