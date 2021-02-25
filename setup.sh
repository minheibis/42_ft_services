# starting minikube
echo "Starting minikube..."
minikube stop
minikube delete
minikube --vm-driver=docker start --extra-config=apiserver.service-node-port-range=1-35000

#setting cluster ip
CLUSTER_IP="$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)"
sed -i 's/192.168.49.2/'$CLUSTER_IP'/g' srcs/metallb/metallb_conf.yaml
#sed -i 's/192.168.49.2/'$CLUSTER_IP'/g' srcs/ftps/setup_ftps.sh
#sed -i 's/192.168.49.2/'$CLUSTER_IP'/g' srcs/nginx/nginx.conf
#sed -i 's/192.168.49.2/'$CLUSTER_IP'/g' srcs/mysql/wordpress.sql
#sed -i 's/192.168.49.2/'$CLUSTER_IP'/g' srcs/telegraf/telegraf.conf

# install metallb
echo "Installing MetalLb..."
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

echo "Enabling addons..."
minikube addons enable metrics-server
minikube addons enable dashboard

echo "Building images..."
eval $(minikube docker-env) #set env to build image inside minikube docker
docker build --no-cache  -t service_nginx ./srcs/nginx
#docker build --no-cache  -t service_mysql ./srcs/mysql
#docker build --no-cache  -t service_php_my_admin ./srcs/php_my_admin
#docker build --no-cache  -t service_wordpress ./srcs/wordpress
#docker build --no-cache  -t service_influxdb ./srcs/influxdb
#docker build --no-cache  -t service_telegraf ./srcs/telegraf
#docker build --no-cache  -t service_grafana ./srcs/grafana
#docker build --no-cache  -t service_ftps ./srcs/ftps
eval $(minikube docker-env -u) #unset env

#IP=$(minikube ip)
#IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
#printf "Minikube IP: ${IP}"

echo "Creating deployments and services..."
kubectl apply -f ./srcs/nginx/nginx.yaml
#kubectl apply -f ./srcs/mysql/mysql.yaml
#kubectl apply -f ./srcs/php_my_admin/php_my_admin.yaml
#kubectl apply -f ./srcs/wordpress/wordpress.yaml
#kubectl apply -f ./srcs/influxdb/influxdb.yaml
#kubectl apply -f ./srcs/telegraf/telegraf.yaml
#kubectl apply -f ./srcs/grafana/grafana.yaml
#kubectl apply -f ./srcs/ftps/ftps.yaml

#echo "Opening the network in your browser"
#open http://$IP

# create test pod
echo "Creating test pods..."
kubectl apply -f bastion.yaml

# open dashbord
echo "Launching dashboard..."
minikube dashboard &