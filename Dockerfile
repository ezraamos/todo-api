FROM webdevops/php-nginx:8.3-alpine

WORKDIR /app

# Update system packages to reduce vulnerabilities
RUN apk update && apk upgrade

COPY . .
RUN composer install --no-dev --optimize-autoloader && \
    chown -R application:application /app