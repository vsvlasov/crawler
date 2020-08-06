# Crawler
Поисковый бот для сбора текстовой информации с веб-страниц и ссылок.

## Зависимости
Для работы бота необходимы `MongoDB` и `RabbitMQ` (устанавливаются вместе через helm)

## Подготовка
Необходимо собрать и запушить докер образы приложения, см.
1. [UI образ](https://gitlab.com/vvlineate/search_engine_ui)
2. [BACKEND образ](https://gitlab.com/vvlineate/search_engine_crawler)

### Деплой стека
Возможны 2 варианта деплоя:
1. С использованием make, в корне проекта выполнить

       make setup_app

2. Вручную

       cd kubernetes/charts/crawler
       helm dep update
       helm upgrade --install crawler ./

### Доступ к приложению
По умолчанию приложение доступно по адресу http://crawler.com

**Note:** Необходимо настроить [hosts](hosts.md)

### Удаление
```shell script
helm uninstall crawler
```
