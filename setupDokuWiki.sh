#!/bin/bash
set -e
DOKUWIKI_NAME=${1:-wiki}

BASEDIR=$(readlink -f $(dirname $0))
docker exec ${DOKUWIKI_NAME} apt-get update
docker exec ${DOKUWIKI_NAME} apt-get install php5-ldap
DEFAULT_LOCAL_PHP=local.php
cp ${BASEDIR}/local.php.template ${BASEDIR}/local.php
cp ${BASEDIR}/users.auth.php.template ${BASEDIR}/users.auth.php
cp ${BASEDIR}/local.protected.php.template ${BASEDIR}/local.protected.php

docker cp ${BASEDIR}/${DEFAULT_LOCAL_PHP} ${DOKUWIKI_NAME}:/var/www/conf/${DEFAULT_LOCAL_PHP}
docker cp ${BASEDIR}/users.auth.php ${DOKUWIKI_NAME}:/var/www/conf/users.auth.php
docker cp ${BASEDIR}/local.protected.php ${DOKUWIKI_NAME}:/var/www/conf/local.protected.php

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






