FROM webdevops/php-nginx:8.3-alpine

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Install packages
RUN composer install --no-interaction --optimize-autoloader --no-cache

RUN chown -R application:application .

# Nginx config
COPY ./.nginx/10-ittyd.conf /opt/docker/etc/nginx/vhost.common.d/