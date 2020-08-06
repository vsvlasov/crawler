# Локальное окружение

Для разработки, в зависимости от разрабатываемой части потребуются установить следующие пакеты:
1. Установить [virtualbox](https://www.virtualbox.org/wiki/Downloads)
2. Установить [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
3. Установить [helm](https://helm.sh/docs/intro/install/)
4. Добавить helm репозитории

       helm repo add stable https://kubernetes-charts.storage.googleapis.com/
       helm repo add bitnami https://charts.bitnami.com/bitnami
       helm repo update

5. Установить [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
6. Установить [Docker](https://docs.docker.com/engine/install/ubuntu/)
7. Установить [Packer](https://learn.hashicorp.com/tutorials/packer/getting-started-install)
