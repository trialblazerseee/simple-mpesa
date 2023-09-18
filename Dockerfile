FROM openjdk:11
ARG SOURCE
ARG COMMIT_HASH
ARG COMMIT_ID
ARG BUILD_TIME
LABEL source=${SOURCE}
LABEL commit_hash=${COMMIT_HASH}
LABEL commit_id=${COMMIT_ID}
LABEL build_time=${BUILD_TIME}

RUN apt-get update \
    && apt-get -y upgrade

ARG database_ip_address
ARG postgresql_password
ARG db-dbuser_password

ENV database_ip_address_env=${database_ip_address}
ENV database_password_env=${postgresql_password}
ENV database_user_password_env=${db_dbuser_password}
RUN echo "Database IP Address in Docker" > $database_ip_address_env
RUN echo "Database User in Docker" > database_user_password_env
RUN echo "Database Password in Docker" > database_password_env

ADD install.sh install.sh

RUN chmod +x install.sh

ENTRYPOINT [ "/install.sh" ]
