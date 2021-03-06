#!/bin/sh

# starting minikube
echo "Starting minikube..."
minikube stop
minikube delete
#	minikube start --vm-driver=docker
minikube start --vm-driver=docker --extra-config=apiserver.service-node-port-range=0-65535

#setting cluster ip
CLUSTER_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"
sed -i 's/192.168.49.2/'$CLUSTER_IP'/g' srcs/metallb/metallb_conf.yaml
#sed -i 's/192.168.49.2/'$CLUSTER_IP'/g' srcs/ftps/setup_ftps.sh
sed -i 's/192.168.49.2/'$CLUSTER_IP'/g' srcs/nginx/nginx.conf
sed -i 's/192.168.49.2/'$CLUSTER_IP'/g' srcs/wordpress/wp-config.php
#sed -i 's/192.168.49.2/'$CLUSTER_IP'/g' srcs/mysql/wordpress.sql
#sed -i 's/192.168.49.2/'$CLUSTER_IP'/g' srcs/telegraf/telegraf.conf

# install metallb
echo "Installing MetalLb..."
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/metallb/metallb_conf.yaml

echo "Enabling addons..."
#minikube addons enable dashboard
#minikube addons enable metrics-server

echo "Building images & Creating deployments and services..."
eval $(minikube docker-env) #set env to build image inside minikube docker
docker build --no-cache  -t service_nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml

docker build --no-cache  -t service_mysql ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml

docker build --no-cache  -t service_wordpress ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml

docker build --no-cache  -t service_phpmyadmin ./srcs/php_my_admin
kubectl apply -f ./srcs/php_my_admin/php_my_admin.yaml

docker build --no-cache  -t service_influxdb ./srcs/influxdb
kubectl apply -f ./srcs/influxdb/influxdb.yaml

docker build --no-cache  -t service_grafana ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana.yaml

#docker build --no-cache  -t service_ftps ./srcs/ftps
#kubectl apply -f ./srcs/ftps/ftps.yaml


eval $(minikube docker-env -u) #unset env

#IP=$(minikube ip)
#IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
#printf "Minikube IP: ${IP}"


#echo "Opening the network in your browser"
open http://$CLUSTER_IP

# create test pod
#echo "Creating test pods..."
#kubectl apply -f bastion.yaml

# open dashbord
echo "Launching dashboard..."
minikube dashboard &