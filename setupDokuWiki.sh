#!/bin/bash
set -e
DOKUWIKI_NAME=${1:-wiki}
LDAP_SERVER=${2:-openldap}
LDAP_ACCOUNTBASE=${3:-ou=accounts, dc=demo, dc=com}

BASEDIR=$(readlink -f $(dirname $0))
docker exec ${DOKUWIKI_NAME} apt-get update
docker exec ${DOKUWIKI_NAME} apt-get install php5-ldap

LOCAL_PROTECTED_PHP=local.protected.php
sed -e "s/{DOKUWIKI_URI}/${DOKUWIKI_NAME}/g" ${BASEDIR}/${LOCAL_PROTECTED_PHP}.template > ${BASEDIR}/${LOCAL_PROTECTED_PHP}
sed -i "s/{LDAP_SERVER}/${LDAP_SERVER}/g" ${BASEDIR}/${LOCAL_PROTECTED_PHP}
sed -i "s/{LDAP_ACCOUNTBASE}/${LDAP_ACCOUNTBASE}/g" ${BASEDIR}/${LOCAL_PROTECTED_PHP}

docker cp ${BASEDIR}/${LOCAL_PROTECTED_PHP} ${DOKUWIKI_NAME}:/var/www/conf/${LOCAL_PROTECTED_PHP}
docker cp ${BASEDIR}/users.auth.php ${DOKUWIKI_NAME}:/var/www/conf/users.auth.php
docker cp ${BASEDIR}/local.php ${DOKUWIKI_NAME}:/var/www/conf/local.php

docker cp ${BASEDIR}/plugins.local.php ${DOKUWIKI_NAME}:/var/www/conf/plugins.local.php
docker cp ${BASEDIR}/acl.auth.php ${DOKUWIKI_NAME}:/var/www/conf/acl.auth.php

docker exec ${DOKUWIKI_NAME} chown -R www-data:www-data /var/www/conf/local.php
docker exec ${DOKUWIKI_NAME} chown -R www-data:www-data /var/www/conf/users.auth.php
docker exec ${DOKUWIKI_NAME} chown -R www-data:www-data /var/www/conf/local.protected.php
docker exec ${DOKUWIKI_NAME} chown -R www-data:www-data /var/www/conf/plugins.local.php
docker exec ${DOKUWIKI_NAME} chown -R www-data:www-data /var/www/conf/acl.auth.php

docker restart wiki
#chown -R www-data:www-data ${BASEDIR}/local.php
#chown -R www-data:www-data ${BASEDIR}/users.auth.php
#chown -R www-data:www-data ${BASEDIR}/local.protected.php
#chown -R www-data:www-data ${BASEDIR}/plugins.local.php
#chown -R www-data:www-data ${BASEDIR}/acl.auth.php






