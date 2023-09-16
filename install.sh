#!/bin/bash

#installs the pkcs11 libraries.
set -e

DATABASE_IP_ADDRESS=$database_ip_address_env
DATABASE_USER=$database_user_env
DATABASE_PASSWORD=$database_password_env

echo "IP ADDRESS $DATABASE_IP_ADDRESS"
echo "User $DATABASE_USER"
echo "Password $DATABASE_PASSWORD"

cd /home/MOSIP

sed -i -e "s/\(host:\).*/\1$DATABASE_IP_ADDRESS/" \
-e "s/\(user:\).*/\1$DATABASE_USER/" \
-e "s/\(password:\).*/\1$DATABASE_PASSWORD/" config.yml

exec "$@"