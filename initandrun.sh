#!/bin/sh
grep -s APP_KEY .env
if [ $? = 1 ] || [ ! -f .env ]
then echo APP_KEY= > .env
  php artisan key:generate
  php artisan jwt:secret
fi
exec heroku-php-apache2 public