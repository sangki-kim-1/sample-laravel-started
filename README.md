# sample-laravel-started

## 버전 정보
- laravel 11
- php 8

## Getting Started
- 시작
``` sh
composer install

php artisan serve
```

``` shell
docker build -t sample-laravel-started:latest .
```

```shell
docker run --rm -p 8000:8000 sample-laravel-started:latest \
    php artisan serve --host=0.0.0.0
```
```shell
docker run --rm -p 8000:8000 sample-laravel-started:latest \
    npm install && npm run dev --host=0.0.0.0
```
```shell
docker build -t sample-laravel-started:latest . --no-cache

docker run --rm -it -p 8080:8080 sample-laravel-started:latest
```

## Containerize
- https://medium.com/@asia.joumaa/deploy-a-laravel-app-into-a-docker-container-af96ac58411d
- 
