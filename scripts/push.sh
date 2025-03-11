#!/bin/bash
rsync --exclude='.git/' --exclude='wp-config.php'  --exclude='robots.txt' --exclude='node_modules' --exclude='uploads' -rvzhe ssh app/ root@${STG_IP}:/var/www/${COMPOSE_PROJECT_NAME}/public/

#rsync --exclude='.git/' --exclude='wp-config.php' --exclude='node_modules' --exclude='uploads' --exclude='robots.txt' -rvzhe ssh app/wp-content/themes/${COMPOSE_PROJECT_NAME}/ root@${STG_IP}:/var/www/${COMPOSE_PROJECT_NAME}/public/wp-content/themes/${COMPOSE_PROJECT_NAME}

#rsync --exclude='.git/' --exclude='wp-config.php' --exclude='node_modules' --exclude='uploads' --exclude='robots.txt' -rvzhe ssh app/wp-content/plugins/ root@${STG_IP}:/var/www/${COMPOSE_PROJECT_NAME}/public/wp-content/plugins
