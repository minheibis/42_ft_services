#!/bin/sh

# starting minikube
echo "Starting minikube..."
minikube stop
minikube delete
minikube start --vm-driver=docker

# open dashbord
echo "Launching dashboard..."
minikube dashboard &

#setting cluster ip
CLUSTER_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"
sed -i 's/192.168.49.2/'$CLUSTER_IP'/g' srcs/metallb/metallb_conf.yaml
sed -i 's/192.168.49.2/'$CLUSTER_IP'/g' srcs/ftps/vsftpd.conf
sed -i 's/192.168.49.2/'$CLUSTER_IP'/g' srcs/nginx/nginx.conf

# install metallb
echo "Installing MetalLb..."
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/metallb_conf.yaml

echo "Enabling addons..."

echo "Building images & Creating deployments and services..."
eval $(minikube docker-env) #set env to build image inside minikube docker
docker build --no-cache  -t base_docker ./srcs/base_docker

docker build --no-cache  -t influxdb-service ./srcs/influxdb
kubectl apply -f ./srcs/influxdb/influxdb.yaml

docker build --no-cache  -t nginx-service ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml

docker build --no-cache  -t mysql-service ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml

docker build --no-cache  -t wordpress-service ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml

docker build --no-cache  -t phpmyadmin-service ./srcs/php_my_admin
kubectl apply -f ./srcs/php_my_admin/php_my_admin.yaml

docker build --no-cache  -t grafana-service ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana.yaml

docker build --no-cache  -t ftps-service ./srcs/ftps
kubectl apply -f ./srcs/ftps/ftps.yaml


eval $(minikube docker-env -u) #unset env

echo "Opening the network in your browser"
xdg-open http://$CLUSTER_IP

