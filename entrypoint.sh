#!/usr/bin/env bash

set -xeuo pipefail

# Run database migration
php artisan migrate --force --no-interaction

# Run database seeder; ignore errors
# set +e
# php artisan db:seed --class=MySeeder --force --no-interaction
# set -e

# Renew caches
# php artisan route:cache
php artisan view:cache
php artisan config:cache

# Link storage
php artisan storage:link --force

# Print all files for debugging purposes
ls -lha

# Start
/entrypoint supervisord
