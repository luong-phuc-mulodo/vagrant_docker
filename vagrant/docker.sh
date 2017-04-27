#!/bin/bash
docker run \
  -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_USER=vagrant \
  -e MYSQL_PASSWORD=vagrant \
  -e MYSQL_DATABASE=sample_app \
  -e TZ=Asia/Tokyo \
  'mysql:5.6'
