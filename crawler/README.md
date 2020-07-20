# Сборка образов
Код для [UI](https://gitlab.com/vvlineate/search_engine_ui)
 и [Crawler](https://gitlab.com/vvlineate/search_engine_crawler)
 сервисов вынесен в отдельные проекты.

Для каждого проекта настроен CI/CD.

### CI/CD
Для проекта настроен CI/CD, пайплайн содержит 2 стейджа:
1. tests - запуск python тестов для кода проекта.
Выполняется всегда.
2. deploy - сборка образа, пуш в Docker hub.
Выполняется только на изменения в master branch.

### Packer
Для сборки и пуша образов используется Packer с Ansible provisioner.


# Локальное окружение
Для разработки, в зависимости от разрабатываемой части потребуются установить следующие пакеты:
1. Установить [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)

    1.1 Создать VM для minikube
    ```shell script
    minikube start --driver=virtualbox --cpus 4 --memory 8192
    ```
    1.2 Включить аддоны
    ```shell script
    minikube addons enable ingress
    ```

# get credentials
gcloud container clusters get-credentials crawler --zone europe-west-1b


# get credentials
gcloud container clusters get-credentials crawler --zone europe-west-1b


# Local run with docker-compose
```shell script
cd kubernetes
kubectl apply -f .
```

Деплой EFK стека
```shell script
cd kubernetes
kubectl apply -f efk/.
```

Установка Kibana
```shell script
helm install kibana stable/kibana \
--set "ingress.enabled=true" \
--set "ingress.hosts={crawler-kibana}" \
--set "env.ELASTICSEARCH_URL=http://elasticsearch-logging:9200"
```

# TODO
1. Пофиксить деплой, terraform зависает в gitlab
2. Пофиксить ingress для kibana
3. Обновить EFK, пофиксить пермишены
4. Сделать helm charts на замену кучи файлов k8s
5. Добавить мониторинг, prometheus
6. Обновить доки для 3-х репозиториев
