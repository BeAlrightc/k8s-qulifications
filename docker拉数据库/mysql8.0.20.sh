#!/bin/sh
docker run \
-p 3306:3306 \
--name mysql \
--privileged=true \
--restart unless-stopped \
-v /mnt/sda1/mysql8.0.20/mysql:/etc/mysql \
-v /mnt/sda1/mysql8.0.20/logs:/logs \
-v /mnt/sda1/mysql8.0.20/data:/var/lib/mysql \
-v /etc/localtime:/etc/localtime \
-e MYSQL_ROOT_PASSWORD=123456 \
-d mysql:8.0.20


