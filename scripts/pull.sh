#!/bin/bash
rsync --exclude='.git/' --exclude='wp-config.php' --exclude='node_modules' --exclude='robots.txt' -rvzhe ssh root@${STG_IP}:/var/www/${COMPOSE_PROJECT_NAME}/public/ app/
