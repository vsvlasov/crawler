apk --no-cache --update add curl make
curl https://get.helm.sh/helm-v3.2.4-linux-amd64.tar.gz | tar zx
mv linux-amd64/helm /usr/bin/
curl -o /usr/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x /usr/bin/kubectl
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
