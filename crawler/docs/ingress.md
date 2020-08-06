# Ingress
Для маршрутизации трафика к приложению и мониторингу используется ingress.

# Адреса для доступа к приложению
1. Crawler UI   -   http://crawler.com
2. Grafana      -   http://monitoring.dashboards
3. Kibana       -   http://monitoring.kibana
4. Prometheus   -   http://monitoring.prom

**Note:**
Чтобы приложение стало доступно по данным адресам необходимо настроить [hosts](./hosts.md).

# Установка
- Для Minikube

      minikube addons enable ingress

- Для GCP

      helm upgrade --install nginx stable/nginx-ingress

      или

      make setup_ingress

# Удаление
- Для Minikube

      minikube addons disable ingress

- Для GCP

      helm uninstall nginx
