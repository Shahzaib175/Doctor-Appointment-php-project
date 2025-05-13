FROM php:8.3-fpm

# Install Nginx and required tools
RUN apt-get update && apt-get install -y \
    nginx curl unzip \
    && apt-get clean

# Copy your custom nginx config
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy your PHP application files
#COPY . /var/www/html/
COPY Frontend/ /var/www/html/
COPY Backend/ /var/www/html/Backend/

# Expose port 80
EXPOSE 80

# Start PHP-FPM and Nginx when the container starts
CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]

