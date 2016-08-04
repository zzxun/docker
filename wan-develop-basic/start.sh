#!/usr/bin/env bash

# start db
service mysqld start
service mongod start
redis-server --protected-mode no > ~/.redis.log &

# open mysql remote connection
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;" -uroot

echo 'start'

/bin/bash