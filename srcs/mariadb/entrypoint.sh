#!/bin/sh
set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo 'Initializing database'
    mysqld --initialize-insecure --user=mysql --datadir=/var/lib/mysql
    echo 'Database initialized'
fi

mysqld --user=mysql --datadir=/var/lib/mysql &

sleep 5

if [ -f /init.sql ]; then
    echo 'Executing init.sql'
    mysql -u root -e "source /init.sql"
    echo 'init.sql executed'
fi

mysqld --user=mysql --datadir=/var/lib/mysql