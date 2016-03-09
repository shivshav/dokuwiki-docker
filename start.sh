set -e

FIRST_RUN_DIR=/first-run.d

for file in $FIRST_RUN_DIR; do
    $FIRST_RUN_DIR/$file
done

#LOCAL_PROTECTED_PHP=local.protected.php
#sed -e "s/{DOKUWIKI_URI}/${BASE_URI}/g" /${LOCAL_PROTECTED_PHP}.template > $CONF_DIR/$LOCAL_PROTECTED_PHP
#sed -i "s/{LDAP_SERVER}/${LDAP_SERVER}/g" $CONF_DIR/${LOCAL_PROTECTED_PHP}
#sed -i "s/{LDAP_ACCOUNTBASE}/${LDAP_ACCOUNTBASE}/g" $CONF_DIR/${LOCAL_PROTECTED_PHP}
#
#
#chown -R www-data:www-data /var/www
#chown -R www-data:www-data /var/dokuwiki-storage

exec /usr/bin/supervisord -c /etc/supervisord.conf
