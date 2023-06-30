#!/bin/bash

if [ ! -f vendor/autoload.php ]; then
    composer install --no-interaction --no-progress
fi

if [ ! -f .env ]; then
    echo "Creating .env file for $APP_ENV environment..."
    cp .env.example .env
else
    echo ".env file already exists, skipping..."
fi

php artisan migrate
php artisan key:generate
php artisan cache:clear

php artisan serve --port=$PORT --host=0.0.0.0 --env=.env
exec docker-php-entrypoint "$@"
