#!/bin/sh

# docker-compose up -d --build meta-folders-postgres-cna-test-s

# docker-compose up -d --build meta-folders-postgres-dim-test-s

docker-compose up -d --build authentication-postgres-s

docker-compose build authentication-test-s

docker-compose run authentication-test-s

docker-compose down autentication-postgres-s
