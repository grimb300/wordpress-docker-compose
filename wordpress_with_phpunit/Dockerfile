FROM wordpress:latest

# Install PHPUnit
RUN curl https://phar.phpunit.de/phpunit-6.5.phar -L -o phpunit.phar && \
  chmod +x phpunit.phar && \
  mv phpunit.phar /usr/local/bin/phpunit && \
  phpunit --version

# Install Subversion and MariaDB client, necessary for the testing framework
# NOTE: Because I've created an external volumen for /tmp, need to fix the permissions
#       I think it is now fixed by making the external volume the right permissions to start with.
# RUN chmod 1777 /tmp && \
#   ls -lad /tmp && \
#   apt-get update && \
#   apt-get -y install subversion mariadb-client && \
#   svn --version
# NOTE: "apt-get -y install ..." used to force yes at prompt
RUN apt-get update && \
  apt-get -y install subversion mariadb-client && \
  svn --version

# My scripts
COPY install-tests.sh /usr/local/bin/
COPY run-tests.sh /usr/local/bin/

# ENTRYPOINT and CMD copied from the official WordPress Dockerfile
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]