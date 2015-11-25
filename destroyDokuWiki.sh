#!/bin/bash
DOKUWIKI_NAME=${DOKUWIKI_NAME:-wiki}
DOKUWIKI_VOLUME=${DOKUWIKI_VOLUME:-wiki-volume}
docker stop ${DOKUWIKI_NAME}
docker rm -v ${DOKUWIKI_NAME}
docker rm -v ${DOKUWIKI_VOLUME}
