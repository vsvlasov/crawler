SHELL := /bin/bash

init_minikube:
	minikube start --driver=virtualbox --cpus 4 --memory 8192;
	minikube addons enable ingress;

setup_ingress:
	helm upgrade --install nginx stable/nginx-ingress

setup_efk:
	cd kubernetes && \
	kubectl apply -f efk/ ;
	cd kubernetes/charts && \
	helm upgrade --install kibana kibana/ \
	--version 0.1.1 \
	-f kibana/custom-values.yaml


setup_prometheus:
	cd kubernetes/charts && \
	helm upgrade --install prom prometheus/ -f prometheus/custom_values.yml;

setup_grafana: delete_configmaps
	cd kubernetes/charts/grafana && \
	kubectl create secret generic datasource-secret --from-file=datasource-secret.yaml && \
	kubectl create configmap grafana-deployment-metrics --from-file=./dashboards/deployment-metrics.json && \
	kubectl create configmap grafana-kubernetes-cluster-monitoring --from-file=./dashboards/kubernetes-cluster-monitoring.json && \
	kubectl create configmap grafana-crawler-metrics --from-file=./dashboards/crawler_dashboard.json && \
	helm upgrade --install grafana bitnami/grafana -f custom_values.yaml;

setup_app:
	cd kubernetes/charts/crawler && helm dep update;
	cd kubernetes/charts && \
	helm upgrade --install crawler ./crawler/


run: setup_ingress setup_efk setup_prometheus setup_grafana setup_app

run_local: setup_efk setup_prometheus setup_grafana setup_app


delete_configmaps:
	-kubectl delete secret datasource-secret;
	-kubectl delete configmap grafana-deployment-metrics;
	-kubectl delete configmap grafana-kubernetes-cluster-monitoring;
	-kubectl delete configmap grafana-crawler-metrics;

delete:
	-helm uninstall crawler;
	-helm uninstall prom;
	-helm uninstall nginx;
	-helm uninstall kibana;
	-helm uninstall grafana;
	-kubectl delete -f kubernetes/efk/;
