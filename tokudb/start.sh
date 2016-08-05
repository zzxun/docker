#!/usr/bin/env bash

# start db
service mongod start
redis-server --protected-mode no > ~/.redis.log &

echo 'start'

/bin/bash