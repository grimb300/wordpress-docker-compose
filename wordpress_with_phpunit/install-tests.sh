#!/bin/sh
if [ $# -ne 1 ]; then
  echo "Script install-tests.sh must have one argument:"
  echo "   install-tests.sh <plugin-to-test>"
else
  if [ -d "wp-content/plugins/$1" ]; then
    cd wp-content/plugins/$1
    if [ -e "./bin/install-wp-tests.sh" ]; then
      ./bin/install-wp-tests.sh wordpress_test_$1  $WORDPRESS_DB_USER $WORDPRESS_DB_PASSWORD $WORDPRESS_DB_HOST latest
      # echo "Successfully installed tests for $1"
    else
      echo "The install script ./bin/install-wp-test.sh does not exist, run wp scaffold plugin-tests <plugin-name>"
    fi
  else
    echo "Plugin $1 does not exist"
  fi
fi