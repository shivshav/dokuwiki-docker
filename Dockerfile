FROM istepanov/dokuwiki
MAINTAINER shivshav@demo.com

RUN apt-get update && apt-get install -y php5-ldap

## Copy php files onto system image (or manipulate them with sed?) 
## Set env vars and retrieve them for parameterized php files

RUN chown -R www-data:www-data /var/dokuwiki-storage/conf

## El Fin
