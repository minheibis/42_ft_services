# starting minikube
echo "Starting minikube..."
minikube delete
minikube --vm-driver=docker start --extra-config=apiserver.service-node-port-range=1-35000

# install metallb


echo "Enabling addons..."
#minikube addons enable dashboard

echo "Launching dashboard..."
#minikube dashboard &

echo "Building images..."
eval $(minikube docker-env)
docker build --no-cache  -t service_nginx ./srcs/nginx


docker build --no-cache  -t my_nginx srcs/nginx/
docker build --no-cache  -t my_mysql srcs/mysql/
docker build --no-cache  -t my_php_my_admin srcs/php_my_admin/
docker build --no-cache  -t my_wordpress srcs/wordpress/
docker build --no-cache  -t my_influxdb srcs/influxdb/
docker build --no-cache  -t my_telegraf srcs/telegraf/
docker build --no-cache  -t my_grafana srcs/grafana/
docker build --no-cache  -t my_ftps srcs/ftps/

eval $(minikube docker-env -u)

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

# open dashbord
minikube dashboard