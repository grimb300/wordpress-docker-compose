# Start from the official composer image
# TODO: Do I need to use a specific version?
FROM composer

# Download version 7 of PHPUnit, WordPress can use version 5.4-7.x
# RUN wget -O phpunit https://phar.phpunit.de/phpunit-7.phar && \
#   chmod +x phpunit && \
#   mv phpunit /usr/local/bin/
RUN wget -O phpunit https://phar.phpunit.de/phpunit-6.5.phar && \
  chmod +x phpunit && \
  mv phpunit /usr/local/bin/

# Install some packages required for PHPUnit to run on WordPress (from chriszarate/wordpress-phpunit)
RUN apk add --no-cache mariadb-client php7-mysqli subversion wget

# Blank entrypoint since we'll be running different commands at different times (from chriszarate/wordpress-phpunit)
ENTRYPOINT []

# For funzies, make the default command 'phpunit --help' (my addition, with inspiration from phpunit/phpunit)
CMD ["phpunit", "--help"]
