#!/bin/bash
mkdir -p /run/php/
sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

if [ -f "/var/www/html/wordpress/wp-config.php" ]; then
	exec "$@";
	exit 0;
fi

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /var/www/html/wordpress
cd /var/www/html/wordpress
rm -rf /var/www/html/wordpress/*

wp core download --allow-root

wp config create	--allow-root \
					--dbname=$DATABASE_NAME \
					--dbuser=$MARIADB_USER \
					--dbpass=$MARIADB_USER_PASSWORD \
					--dbhost=mariadb:3306 \
					--path='/var/www/html/wordpress/'

wp core install		--allow-root \
					--url=$WORDPRESS_URL \
					--title=$WORDPRESS_TITLE \
					--admin_user=$WORDPRESS_ADMIN_USER \
					--admin_password=$WORDPRESS_ADMIN_PASSWORD \
					--admin_email=$WORDPRESS_ADMIN_EMAIL

wp user create	--allow-root \
				$WORDPRESS_USER \
				$WORDPRESS_USER_EMAIL \
				--role='author' \
				--user_pass=$WORDPRESS_USER_PASSWORD

exec "$@"
