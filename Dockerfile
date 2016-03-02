FROM istepanov/dokuwiki
MAINTAINER shivshav@demo.com

RUN apt-get update && apt-get install -y php5-ldap


#CONF_DIR=/var/dokuwiki-storage/conf

# Sets the admin password and email (needs parameterization)
COPY users.auth.php /var/dokuwiki-storage/conf

# Sets title and license. Do we even need this? Yes we do if we want to avoid the install.php initialization
COPY local.php /var/dokuwiki-storage/conf

# Sets the authentication to be ldap-based. Non-parameterized
COPY plugins.local.php /var/dokuwiki-storage/conf

# Absolutely necessary and but not parameterized as of yet
COPY acl.auth.php /var/dokuwiki-storage/conf

# Heavily parameterized and absolutely necessary
#COPY local.protected.php /var/dokuwiki-storage/conf


## Copy php files onto system image (or manipulate them with sed?) 
## Set env vars and retrieve them for parameterized php files

RUN chown -R www-data:www-data /var/dokuwiki-storage/conf

## El Fin
