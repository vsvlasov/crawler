# GitLab CI/CD

##### Переменные GitLab
Для работы деплоя необходимо настроить следующие переменные в CI/CD gitlab проекта:
- Variable: $GOOGLE_MACHINE_TYPE (Опционально, необходима для init_cluster_job)
- Variable: $GOOGLE_PROJECT (Google Project ID, e.g. crawler-12345)
- File: $KEY_FILE (Содержимое JSON файла для [сервис аккаунта GCP](https://cloud.google.com/iam/docs/creating-managing-service-accounts))

##### Окружения
- develop (minikube)
- staging (GCP)
- production (GCP)

##### Staging окружение
Деплой на staging осуществляется автоматически при мердже в develop ветку.

##### Production окружение
Деплой на production осуществляется запуском джобы `deploy_production_job`.

**Note:** Запускается вручную, работает только для master ветки.

### Ops scripts
Вспомогательные bash скрипты находятся в `ops/` директории.
