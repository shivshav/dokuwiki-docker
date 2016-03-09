#!/bin/bash

echo "Creating configs from template..."
LOCAL_PROTECTED_PHP=local.protected.php
sed -e "s/{DOKUWIKI_URI}/${BASE_URI}/g" /${LOCAL_PROTECTED_PHP}.template > $CONF_DIR/$LOCAL_PROTECTED_PHP
sed -i "s/{LDAP_SERVER}/${LDAP_SERVER}/g" $CONF_DIR/${LOCAL_PROTECTED_PHP}
sed -i "s/{LDAP_ACCOUNTBASE}/${LDAP_ACCOUNTBASE}/g" $CONF_DIR/${LOCAL_PROTECTED_PHP}

mv $CONF_DIR/*.php /var/dokuwiki-storage/conf/

echo "Setting permissions on directories..."
chown -R www-data:www-data /var/www
chown -R www-data:www-data /var/dokuwiki-storage
