################################################################################
# Base image
################################################################################

FROM ubuntu:14.04.4

################################################################################
# Build instructions
################################################################################

# Install packages
RUN apt-get update && apt-get install -my \
  curl \
  wget \
  php5-curl \
  php5-fpm \
  php5-gd \
  php5-memcached \
  php5-mysql \
  php5-mcrypt \
  php5-sqlite \
  php5-xdebug \
  php-apc \
  vim 
  
RUN php5enmod mcrypt

# let php5-fpm listen to port 9000
RUN sed -i 's/\/var\/run\/php5-fpm.sock/9000"/g' /etc/php5/fpm/pool.d/www.conf

EXPOSE 9000
CMD ["php5-fpm", "-F"]