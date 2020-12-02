#!/bin/sh
grep -s APP_KEY .env
if [ $? = 1 ] || [ ! -f .env ]
then echo APP_KEY= > .env
  php artisan key:generate
  php artisan jwt:secret
fi
php artisan migrate --force
exec heroku-php-apache2 public