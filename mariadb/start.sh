#!/usr/bin/env bash

# start db
service mongod start
redis-server --protected-mode no > ~/.redis.log &
/etc/init.d/mysql start

echo 'start'

/bin/bash