<?php


$conf['useacl']      = 1;
$conf['openregister']= 0;
$conf['authtype']    = 'authldap';
 
#$conf['auth']['ldap']['server']      = 'localhost';
#$conf['auth']['ldap']['port']        = 389;
#$conf['auth']['ldap']['server']      = 'authldap://openladp:389'; #instead of the above two settings
#$conf['auth']['ldap']['usertree']    = 'ou=accounts,dc=demo,dc=com';
#$conf['auth']['ldap']['grouptree']   = 'ou=group,dc=demo,dc=com';
#$conf['auth']['ldap']['userfilter']  = '(&(uid=%{user})(objectClass=posixAccount))';
#$conf['auth']['ldap']['groupfilter'] = '(&(objectClass=posixGroup)(|(gidNumber=%{gid})(memberUid=%{user})))';



#$conf['plugin']['authldap']['server']      = 'openldap';
#$conf['plugin']['authldap']['usertree']    = 'uid=%{user}, ou=accounts, dc=demo, dc=com';
#$conf['plugin']['authldap']['grouptree']   = 'ou=group, dc=demo dc=com';
#$conf['plugin']['authldap']['groupfilter'] = '(&(objectClass=posixGroup)(|(memberUid=%{uid})(gidNumber=%{gid})))';

$conf['useacl']      = 1;
$conf['openregister']= 0;
$conf['authtype']    = 'authldap';
 
$conf['auth']['ldap']['server']      = 'openldap';
$conf['auth']['ldap']['port']        = 389;
$conf['auth']['ldap']['usertree']    = 'ou=accounts,dc=demo,dc=com';
#$conf['auth']['ldap']['grouptree']   = 'dc=demo,dc=com';
$conf['auth']['ldap']['userfilter']  = '(&(uid=%{user}))';
#$conf['auth']['ldap']['groupfilter'] = '(&(objectClass=posixGroup)(uniqueMember=%{dn}))';
$conf['auth']['ldap']['version']  = 3;

