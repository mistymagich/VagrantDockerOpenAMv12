#!/bin/bash

OPTS=""

if [ ! -z "$1" ]; then
	OPTS=$1
fi

docker run -it -p 8080:8080 --dns=127.0.0.1 --entrypoint=$OPTS openam
