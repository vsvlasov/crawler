# Мониторинг приложения
Стек для мониторинга
1. `Prometheus` - Сбор метрик kubernetes
2. `Grafana` - Дашборды для визуализации

### Деплой стека
Возможны 2 варианта деплоя:
1. С использованием make, в корне проекта выполнить

       make setup_prometheus
       make setup_grafana

2. Вручную
   - Prometheus

	     cd kubernetes/charts
	     helm upgrade --install prom prometheus/ -f prometheus/custom_values.yml

   - Grafana

         cd kubernetes/charts/grafana

         Создать configMaps для предустановленных дашбордов
         kubectl create secret generic datasource-secret --from-file=datasource-secret.yaml
	     kubectl create configmap grafana-deployment-metrics --from-file=./dashboards/deployment-metrics.json
	     kubectl create configmap grafana-kubernetes-cluster-monitoring --from-file=./dashboards/kubernetes-cluster-monitoring.json
	     kubectl create configmap grafana-crawler-metrics --from-file=./dashboards/crawler_dashboard.json

	     Установка с помощью Helm
	     helm upgrade --install grafana bitnami/grafana -f custom_values.yaml


### Доступ к Prometheus
По умолчанию Prometheus доступен по адресу http://monitoring.prom

### Доступ к Grafana
По умолчанию Prometheus доступен по адресу http://monitoring.dashboards

**Note:** Необходимо настроить [hosts](hosts.md)

### Grafana dashboards
Вместе с Grafana устанавливаются дефолтные дашборды для мониторинга.
1. `Crawler metrics` - Статисти по работе бота
2. `Kubernetes Deployment Metrics` - Метрики по деплою в Kubernetes (RAM, CPU usage, etc.)
3. `Kubernetes Cluster Monitoring` - Метрики кластера Kubernetes (RAM, CPU usage, etc.)

# Удаление стека
В корне проекта выполнить

    make delete_configmaps
    helm uninstall grafana prom

# Alertmanager
В Prometheus настроены алерты с отправкой сообщений в Slack:
```
Workspace: devops-team-otus.slack.com
Channel: #vladimir_vlasov
```

Добавлены следующие алерты:
1. `NoParsedPages` - Нет спарсеных страниц за последние 15 минут

2. `ParsedPagesRateLow` - Рейт спарсеных страниц за 15 минут < 0.2

3. `InstanceDown` - Свидетельствует об упавших инстансах / недоступности endpoint для сбора метрик
