# u may change this
MYSQL='/usr/bin/mysql'
mysqlhost="localhost"
mysqldb="wpdb"
mysqluser="dbuser"
mysqlpass="bbwsucks"
wptitle="Drugstore"
wpuser="pharmacist"
wppass="ketamine"
wpemail="info@drug.store"
siteurl="localhost"

# Jus don't change this shit down there here...
cd /var/www/html

# Build our wp-config.php file
sed -e "s/localhost/"$mysqlhost"/" -e "s/database_name_here/"$mysqldb"/" -e "s/username_here/"$mysqluser"/" -e "s/password_here/"$mysqlpass"/" wp-config-sample.php > wp-config-docker.php

# Grab our Salt Keys
SALT=$(curl -L https://api.wordpress.org/secret-key/1.1/salt/)
STRING='thissssshituniqueashell...ig...not.really.so.imma.stop.now--lol69420'
printf '%s\n' "g/$STRING/d" a "$SALT" . w | ed -s wp-config.php

# Run our install ...
curl -d "weblog_title=$wptitle&user_name=$wpuser&admin_password=$wppass&admin_password2=$wppass&admin_email=$wpemail" http://$siteurl/wp-admin/install.php?step=2

# Tidy up
rm wp-config-sample.php