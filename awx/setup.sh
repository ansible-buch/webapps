#!/bin/sh

COMPOSE_DIR=awxcompose

install -d -m 777 $COMPOSE_DIR/redis_socket
install -d -m 777 $COMPOSE_DIR/memcached_socket

chmod 666 $COMPOSE_DIR/redis.conf
chmod 600 $COMPOSE_DIR/SECRET_KEY
