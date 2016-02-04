#!/bin/bash
DOKUWIKI_NAME=${DOKUWIKI_NAME:-dokuwiki}
DOKUWIKI_VOLUME=${DOKUWIKI_VOLUME:-dokuwiki-volume}

echo "Removing ${DOKUWIKI_NAME}..."
docker stop ${DOKUWIKI_NAME} &> /dev/null
docker rm -v ${DOKUWIKI_NAME} &> /dev/null
echo "Removing ${DOKUWIKI_VOLUME}..."
docker rm -v ${DOKUWIKI_VOLUME} &> /dev/null
