#!/bin/bash
set -e
DOKUWIKI_NAME=${1:-dokuwiki}
DOKUWIKI_VOLUME=${2:-dokuwiki-volume}
DOKUWIKI_IMAGE_NAME=${3:-istepanov/dokuwiki}
LDAP_SERVER=${4:-127.0.0.1}

# Create DokuWiki volume
docker run \
--name ${DOKUWIKI_VOLUME} \
${DOKUWIKI_IMAGE_NAME} \
echo "Create DokuWiki volume."

# Start DokuWiki.
docker run \
--name ${DOKUWIKI_NAME} \
--link ${LDAP_SERVER} \
-p 8000:80 \
--volumes-from ${DOKUWIKI_VOLUME} \
-d ${DOKUWIKI_IMAGE_NAME}

