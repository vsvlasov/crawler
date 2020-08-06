# Hosts
По умолчанию используется ingress, необходимо добавить в `/etc/hosts`
```
<your_ip> monitoring.kibana monitoring.dashboards monitoring.prom crawler.com
```

и части вашего приложения станут доступны по указанным адресам.

### Как получить IP:
- Для minikube выполнить `minikube ip`, ingress должен быть включен
- Для GCP `kubectl get svc`, необходимо найти External-IP nginx-ingress
```
NAME                                  TYPE           CLUSTER-IP      EXTERNAL-IP
crawler-backend                       ClusterIP      10.59.245.120   <none>
crawler-mongodb                       ClusterIP      10.59.247.236   <none>
crawler-mongodb-metrics               ClusterIP      10.59.246.246   <none>
crawler-rabbitmq                      ClusterIP      10.59.255.83    <none>
crawler-rabbitmq-headless             ClusterIP      None            <none>
crawler-ui                            NodePort       10.59.255.3     <none>
elasticsearch-logging                 ClusterIP      10.59.251.133   <none>
grafana                               NodePort       10.59.245.132   <none>
kibana                                NodePort       10.59.250.97    <none>
nginx-nginx-ingress-controller        LoadBalancer   10.59.244.47    35.241.152.132
```
