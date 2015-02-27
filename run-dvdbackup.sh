#!/bin/sh

RIPS="$PWD/rips"

mkdir -p "$RIPS" &> /dev/null

docker rm -f dvdbackup

docker run \
-ti \
--privileged \
-v /etc/localtime:/etc/localtime:ro \
-v /dev/sr0:/dev/dvd \
-v $RIPS:/rips \
--name dvdbackup marvambass/dvdbackup
