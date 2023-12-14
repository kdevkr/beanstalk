#!/bin/bash
ENVIRONMENT_NAME=`/opt/elasticbeanstalk/bin/get-config container -k environment_name`
METADATA_TOKEN=`curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
INSTANCE_ID=`curl -s -H "X-aws-ec2-metadata-token: $METADATA_TOKEN" http://169.254.169.254/latest/meta-data/instance-id`

sudo hostnamectl set-hostname "${ENVIRONMENT_NAME}_${INSTANCE_ID}"