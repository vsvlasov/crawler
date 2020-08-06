# Terraform
Отвечает за деплой GKE кластера

# Подготовка
1. Перейти в директорию terraform

       cd infra/terraform

2. Скопировать **terraform.tfvars.example**

       cp terraform.tfvars.example terraform.tfvars

3. Изменить значение переменной `project` в `terraform.tfvars` на свое

4. Заинитить terraform

       terraform init

# Запуск кластера
1. Убедиться, что будут созданы нужные ресурсы

       terraform plan

В дефолтной конфигурации создается кластер с 2 node pool'ами
2. Если все верно, применить конфигурацию

       terraform apply

# Удаление кластера
```shell script
cd infra/terraform
terraform destroy
```
