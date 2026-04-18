#!/usr/bin/env sh
set -e

cd /var/www/html

mkdir -p storage/framework/cache \
         storage/framework/sessions \
         storage/framework/views \
         storage/logs \
         bootstrap/cache \
         public

chown -R www-data:www-data storage bootstrap/cache public || true
chmod -R 775 storage bootstrap/cache public || true

php artisan storage:link || true

if [ "${RUN_MIGRATIONS}" = "true" ]; then
  php artisan migrate --force || true
fi

php artisan optimize:clear || true
php artisan config:cache || true
php artisan route:cache || true
php artisan view:cache || true

exec "$@"