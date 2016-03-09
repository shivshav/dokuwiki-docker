FROM istepanov/dokuwiki
MAINTAINER shivshav@demo.com

RUN apt-get update && apt-get install -y php5-ldap

ENV LDAP_SERVER openldap
ENV LDAP_ACCOUNTBASE ou=accounts,dc=demo,dc=com
ENV BASE_URI dokuwiki

ENV CONF_DIR /dokuwiki-conf

# Sets the admin password and email (needs parameterization)
COPY users.auth.php local.php plugins.local.php acl.auth.php $CONF_DIR/

# Sets title and license. Do we even need this? Yes we do if we want to avoid the install.php initialization
#COPY local.php $CONF_DIR

# Sets the authentication to be ldap-based. Non-parameterized
#COPY plugins.local.php $CONF_DIR

# Absolutely necessary and but not parameterized as of yet
#COPY acl.auth.php $CONF_DIR

# Heavily parameterized and absolutely necessary
COPY local.protected.php.template start.sh /

RUN mkdir /first-run.d/
COPY ci-conf.sh /first-run.d/
#COPY start.sh /
#RUN chmod +x start.sh

## Copy php files onto system image (or manipulate them with sed?) 
## Set env vars and retrieve them for parameterized php files

RUN chown -R www-data:www-data $CONF_DIR

## El Fin
