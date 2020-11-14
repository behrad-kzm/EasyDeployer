#!/bin/bash

cd ../../

if [ /etc/nginx/sites-available/app ];
then 
		echo $'\n-----Removing existing nginx app-----\n';
		sudo rm /etc/nginx/sites-available/app;
		sudo rm /etc/nginx/sites-enabled/app;
fi

systemctl daemon-reload
echo $'\n-----Creating nginx configuration-----\n';

echo "setting $1 as server domain"
var_server_ip=$1

DIR=$PWD
config=$'server {\n\tlisten 80;\n\tserver_name '$var_server_ip$';\n\nlocation / {\n\tinclude proxy_params;\n\tproxy_pass http://unix:'$DIR$'/app.sock;\n\t}\n}\n'
nginx_path="/etc/nginx/sites-available/app"

echo $'\n-----Creating nginx sites-available-----\n';
echo "$config" > $nginx_path

echo $'\n-----Linking nginx server-----\n';
sudo ln -s $nginx_path /etc/nginx/sites-enabled

echo $'\n-----Testing nginx server-----\n';
sudo nginx -t

echo $'\n-----Restarting nginx server-----\n';
sudo systemctl restart nginx

echo $'\n-----Adjusting firewall to allow access to nginx server-----\n';
sudo ufw allow 'Nginx Full'

echo $'\n-----Done-----\n';
cd  Runner/scripts