FROM webdevops/php-nginx:8.2

ENV WEB_DOCUMENT_ROOT /app/public

COPY ./ /app
