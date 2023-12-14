#!/bin/bash
NEW_RELIC_LICENSE_KEY=`/opt/elasticbeanstalk/bin/get-config environment -k NEW_RELIC_LICENSE_KEY`
NEW_RELIC_APP_NAME=`/opt/elasticbeanstalk/bin/get-config environment -k NEW_RELIC_APP_NAME`

sed -i "s/^license_key:.*/license_key: ${NEW_RELIC_LICENSE_KEY}/g" /var/app/newrelic/newrelic.yml
sed -i "s/^app_name:.*/app_name: ${NEW_RELIC_APP_NAME}/g" /var/app/newrelic/newrelic.yml