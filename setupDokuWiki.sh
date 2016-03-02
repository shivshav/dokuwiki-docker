#!/bin/bash
set -e
DOKUWIKI_NAME=${1:-dokuwiki}
LDAP_SERVER=${2:-openldap}
LDAP_ACCOUNTBASE=${3:-ou=accounts, dc=demo, dc=com}

BASEDIR=$(readlink -f $(dirname $0))

echo "Dokuwiki setup complete!"
