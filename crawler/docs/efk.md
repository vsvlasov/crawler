# Elasticsearch-Fluentd-Kibana (EFK)
Стек для сбора и визуализации логов

1. `Elasticsearch` - Для хранения логов
2. `Fluentd` - Сбор логов с подов и запись в эластик
3. `Kibana` - Визуализация логов

### Деплой стека
Возможны 2 варианта деплоя:
1. С использованием make, в корне проекта выполнить

       make setup_efk

2. Вручную

       kubectl apply -f kubernetes/efk
       cd kubernetes/charts
       helm upgrade --install kibana ./kibana --version 0.1.1 -f kibana/custom-values.yaml

**Note:**

 Для `minikube` перед деплоем необходимо добавить лейбл monitoring на ноду

    kubectl get nodes
    kubectl label nodes <your-node-name> monitoring=true

### Доступ к Kibana
По умолчанию Kibana доступна по адресу http://monitoring.kibana

**Note:** Необходимо настроить [hosts](hosts.md)
