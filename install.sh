#!/bin/bash

#installs the pkcs11 libraries.
set -e

DATABASE_IP_ADDRESS=$database_ip_address_env
DATABASE_PASSWORD=$database_password_env
DATABASE_USER_PASSWORD=$database_user_password_env

echo "IP ADDRESS $DATABASE_IP_ADDRESS"
echo "Password $DATABASE_PASSWORD"
echo "User Password $DATABASE_USER_PASSWORD"

cd /home/MOSIP

sed -i -e "s/\(host:\).*/\1$DATABASE_IP_ADDRESS/" \
-e "s/\(password:\).*/\1$DATABASE_USER_PASSWORD/" config.yml

cd /home/MOSIP/db_scripts/mosip_mpesa
sed -i -e "s/\(DB_SERVERIP=\).*/\1$DATABASE_IP_ADDRESS/" \
-e "s/\(SU_USER_PWD=\).*/\1$DATABASE_PASSWORD/" \
-e "s/\(DBUSER_PWD=\).*/\1$DATABASE_USER_PASSWORD/" deploy.properties

RUN chmod +x deploy.sh "deploy.properties"

exec "$@"