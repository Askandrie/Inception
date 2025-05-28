#!/bin/sh
set -e

cd /wordpress

if [ ! -f index.php ]; then
    echo "Téléchargement de WordPress..."
    wp core download --allow-root
fi

maxtry=30
while ! mysql -h"$WORDPRESS_DB_HOST" -u"$WORDPRESS_DB_USER" -p"$WORDPRESS_DB_PASSWORD" -e "SELECT 1;" "$WORDPRESS_DB_NAME" > /dev/null 2>&1; do
    sleep 2
    maxtry=$((maxtry - 1))
    if [ $maxtry -eq 0 ]; then
        echo "DB injoignable"
        exit 1
    fi
done

if [ ! -f wp-config.php ]; then
    echo "Création du wp-config.php..."
    wp config create --allow-root \
        --dbname="$WORDPRESS_DB_NAME" \
        --dbuser="$WORDPRESS_DB_USER" \
        --dbpass="$WORDPRESS_DB_PASSWORD" \
        --dbhost="$WORDPRESS_DB_HOST" \
        --path=/wordpress
fi

if ! wp core is-installed --allow-root; then
    echo "Installation de WordPress..."
    wp core install --allow-root \
        --url="$WORDPRESS_URL" \
        --title="$WORDPRESS_TITLE" \
        --admin_user="$WORDPRESS_ADMIN_USER" \
        --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
        --admin_email="$WORDPRESS_ADMIN_EMAIL"

    wp plugin install redis-cache speedycache --activate --allow-root
    sed -i "/^\/\* That's all, stop editing! Happy publishing. \*\//i\
        define('WP_REDIS_HOST', 'ygaiffie-redis');\
        define('WP_REDIS_PORT', 6379);\
        define('WP_REDIS_DATABASE', 0);" /wordpress/wp-config.php
    wp plugin update --all --allow-root
    wp redis enable --allow-root
    wp theme install twentytwentyfour --activate --allow-root
    wp theme list --status=inactive --field=name --allow-root | xargs -r wp theme delete --allow-root
    wp plugin delete hello --allow-root || true
    wp plugin activate akismet --allow-root || true
fi

chown -R 100:101 /wordpress
sed -i 's/^user = .*/user = 100/; s/^group = .*/group = 101/' /etc/php83/php-fpm.d/www.conf

echo "WordPress terminé !"

exec php-fpm83 -F