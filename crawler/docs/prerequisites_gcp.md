# GCP окружение

Приложение деплоится в GCP, предусмотрены 2 namespace для staging и production окружения.

# Подготовка GCP
1. [Создать аккаунт GCP](https://cloud.google.com/free)
2. [Создать проект GCP](https://cloud.google.com/resource-manager/docs/creating-managing-projects)
3. [Установить gcloud клиент](https://cloud.google.com/sdk/install)
4. (Опционально) Создать кластер GKE с использованием [Terraform](./tf.md)
5. Установить [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

**Note**
[CI/CD](./gitlab.md) деплой в staging namespace осуществляется при мердже ПРа в develop.
Production окружение деплоится джобой, которую необходимо запускать вручную, когда изменения в master ветке.
