#!/usr/bin/env bash

HOSTS_IP=$(route -n | awk '/UG[ \t]/{print $2}')
if [ -z "$HOSTS_IP" ]
then
      echo "HOSTS_IP is empty"
else
      export HOSTS_IP=${HOSTS_IP}
      echo ${HOSTS_IP} ${COMPOSE_PROJECT_NAME}.my.local  >> /etc/hosts
      echo "HOSTS_IP is set to ${HOSTS_IP}"
fi


rm /update-hosts.sh
