#!/bin/sh
# echo "Running run-tests.sh with $# arguments"
if [ $# -lt 2 ] || [ $# -gt 3 ]; then
  echo "Script run-tests.sh must have two or three arguments:"
  echo "   run-tests.sh <plugin-to-test> <test-file>"
  echo "   run-tests.sh <plugin-to-test> <test-class> <test-file>"
  echo "   run-tests.sh <plugin-to-test> <directory>"
else
  if [ -d "wp-content/plugins/$1" ]; then
    cd wp-content/plugins/wp-meta-verify
    if [ $# -eq 2 ]; then
      if [ -e $2 ] || [ -d $2 ]; then
        phpunit $2
        # echo "Successfully executed tests for $1"
      else
        echo "The file/directory $2 does not exist"
      fi
    elif [ $# -eq 3 ]; then
      if [ -e $3 ]; then
        phpunit $2 $3
        # echo "Successfully executed tests for $1"
      else
        echo "The file/directory $3 does not exist"
      fi
    fi
  else
    echo "Plugin $1 does not exist"
  fi
fi