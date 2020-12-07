#!/bin/bash

if [ ! -s "./ci/pa11y-config.json" ]; then 
   echo "The file ./ci/pa11y-config.json either doesn't exist or is empty."
   exit 1
fi

echo -e "\n Pa11y testing started... \n"

EXIT_CODE=0

pa11y-ci --config ./ci/pa11y-config.json || EXIT_CODE=$?

echo $EXIT_CODE

echo $WORKSPACE
touch testing

set -e

pa11y-ci-reporter-html --source ./pa11y-ci-results.json --destination ./pa11y-ci-results

rm pa11y-ci-results.json

echo -e "\n Pa11y testing completed... \n"

exit $EXIT_CODE