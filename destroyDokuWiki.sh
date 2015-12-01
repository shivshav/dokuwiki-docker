#!/bin/bash
DOKUWIKI_NAME=${DOKUWIKI_NAME:-dokuwiki}
DOKUWIKI_VOLUME=${DOKUWIKI_VOLUME:-dokuwiki-volume}
docker stop ${DOKUWIKI_NAME}
docker rm -v ${DOKUWIKI_NAME}
docker rm -v ${DOKUWIKI_VOLUME}
