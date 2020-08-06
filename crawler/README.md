# Crawler
Инфраструктурный репозиторий для поискового бота.

# Запуск приложения локально
1. Выполнить шаги из [Подготовка локального окружения](docs/prerequisites_local.md)
2. Собрать [Docker образы](./docs/docker.md)
3. Запустить в корне проекта `make init_minikube`
4. Запустить в корне проекта `make run_local`
5. Обновить [hosts](./docs/hosts.md)

# Запуск приложения в GCP
1. [Настроить GCP](docs/prerequisites_gcp.md)
2. [Подготовить gitlab](./docs/gitlab.md)
3. [Запустить пайплайн для деплоя](./docs/gitlab.md)


# Проверка работоспособности
При первом запуске необходимо немного подождать, пока поды в кластере задеплоятся.
Проверить статус подов можно с помощью команды

    kubectl get pods

Для проверки, необходимо перейти по ссылке http://crawler.com

# Документация
- [Подготовка локального окружения](docs/prerequisites_local.md)
- [Подготовка GCP окружения](docs/prerequisites_gcp.md)
- Kubernetes
  - [Nginx Ingress](./docs/ingress.md)
  - [Логгирование EFK](./docs/efk.md)
  - [Мониторинг Prometheus+Grafana](./docs/monitoring.md)
  - [App crawler](./docs/crawler.md)
- [Terraform](./docs/tf.md)
- [CI/CD](./docs/gitlab.md)
- [Docker](./docs/docker.md)
