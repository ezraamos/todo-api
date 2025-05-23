FROM webdevops/php-nginx:8.3-alpine

ENV WEB_DOCUMENT_ROOT=/app/public

WORKDIR /app

COPY . .
# Install packages
RUN composer install --no-interaction --optimize-autoloader --no-cache

# Set permissions
RUN chown -R application:application .

# Then make specific files executable
RUN chmod +x /app/entrypoint.sh
