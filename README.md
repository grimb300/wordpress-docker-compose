# WordPress development environment using Docker

This development environment is the confluence of the following:

- [kassambara/wordpress-docker-compose](https://github.com/kassambara/wordpress-docker-compose) - My repository is a direct fork. I liked the Makefile methodology and autoconfigure. It also added [WP-CLI](https://wp-cli.org/) to a "standard" WordPress Docker environment. See [README](https://github.com/kassambara/wordpress-docker-compose) for more information.
- [chriszarate/docker-compose-wordpress](https://github.com/chriszarate/docker-compose-wordpress) - This repository adds [PHPUnit](https://phpunit.de/) for testing purposes. See [README](https://phpunit.de/) for more information.
- My own experience with customizing a more standard WordPress Docker environment to suit my needs. I've parameterized the base environment to be more friendly to having multiple environments running simultaneously.

Getting started:

- Download the Docker environment:
  ``` bash
  git clone https://github.com/grimb300/wordpress-docker-compose.git
  cd wordpress-docker-compose
  # Note: Right now my changes are on branch my-mods
  git checkout my-mods
  ```
- Edit .env (if necessary):
  - If running multiple instances, update the ports used:
    ```
    WORDPRESS_WEBSITE_URL="http://localhost:8080"
    WORDPRESS_WEBSITE_URL_WITHOUT_HTTP=localhost:8080
    WORDPRESS_PORT=8080
    PHPMYADMIN_PORT=8084
    ```
  - Credentials:
    ```
    DATABASE_PASSWORD=password
    DATABASE_USER=root
    WORDPRESS_ADMIN_USER="foo"
    WORDPRESS_ADMIN_PASSWORD="bar"
    WORDPRESS_ADMIN_EMAIL="your-email@example.com"
    ```
- Autoinstall (and start) the environment:
  ``` bash
  # Need to make testsuite_wp (/tmp) globally rwx and sticky
  chmod 1777 testsuite_wp
  make autoinstall
  ```
- Shut down the environment:
  ``` bash
  make down
  ```
- Restart the environment (after initial autoinstall)
  ``` bash
  make start
  ```
- WP-CLI (WordPress Command Line Interface) Alias for wp added to wordpress_with_phpunit/.aliases
  ``` bash
  wp="docker-compose run --rm wpcli"
  wp <command>
  ```
- Setup/Run PHPUnit tests
  ``` bash
  source wordpress_with_phpunit/.aliases
  wp scaffold plugin-tests <plugin-name>
  install-tests <plugin-name>
  run-tests <plugin-name> <test-file>
  ```

Future work:

- Automate the installation more. This still requires some amount of editing config files before the initial install.
- Create a local proxy so launching an environment automatically chooses an open port AND allows using names (example: wp-test-env.dev)