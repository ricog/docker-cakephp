#!/bin/bash

#TODO - this needs to be moved. Run from a separate container.
cd /var/www/site
export $APP_ENV
bin/cake Migrations.migration run all

exec "$@"
