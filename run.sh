#!/bin/sh

docker build -t sample-laravel-started:latest . --no-cache
docker run --rm -p 8080:80 sample-laravel-started:latest

