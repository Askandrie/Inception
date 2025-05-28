#!/bin/sh
set -e

echo "MARIADB_DATABASE='$MARIADB_DATABASE'"
echo "MARIADB_WP_USER='$MARIADB_WP_USER'"
echo "MARIADB_WP_PASSWORD='$MARIADB_WP_PASSWORD'"
echo "MARIADB_ADMIN_USER='$MARIADB_ADMIN_USER'"
echo "MARIADB_ADMIN_PASSWORD='$MARIADB_ADMIN_PASSWORD'"

chown -R mysql:mysql /var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initialisation de la base de données..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql --skip-test-db

    mariadbd --user=mysql --datadir=/var/lib/mysql --skip-networking --socket=/run/mysqld/mysqld.sock &
    pid="$!"

    for i in $(seq 1 30); do
            if mariadb-admin --protocol=socket --socket=/run/mysqld/mysqld.sock ping --silent; then
                break
            fi
            sleep 1
        done

    echo "Commande SQL envoyée à mysql :"
    cat <<EOSQL
CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};

-- User pour WordPress
CREATE USER IF NOT EXISTS '${MARIADB_WP_USER}'@'%' IDENTIFIED BY '${MARIADB_WP_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_WP_USER}'@'%';

-- User pour Adminer (full access, pour l'admin uniquement)
CREATE USER IF NOT EXISTS '${MARIADB_ADMIN_USER}'@'%' IDENTIFIED BY '${MARIADB_ADMIN_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_ADMIN_USER}'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
EOSQL

    mariadb -u root --protocol=socket --socket=/run/mysqld/mysqld.sock <<EOSQL
CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};

-- User pour WordPress
CREATE USER IF NOT EXISTS '${MARIADB_WP_USER}'@'%' IDENTIFIED BY '${MARIADB_WP_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_WP_USER}'@'%';

-- User pour Adminer (full access, pour l'admin uniquement)
CREATE USER IF NOT EXISTS '${MARIADB_ADMIN_USER}'@'%' IDENTIFIED BY '${MARIADB_ADMIN_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_ADMIN_USER}'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
EOSQL

    if [ $? -ne 0 ]; then
        echo "ERREUR lors de l'exécution du SQL d'init !" >&2
    else
        echo "SQL d'init exécuté avec succès !"
    fi

    kill "$pid"
    wait "$pid"

else
    echo "Base de données déjà initialisée, rien à faire."
fi

exec mariadbd --user=mysql --datadir=/var/lib/mysql --port=3306