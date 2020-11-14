#!/bin/bash

echo $'\n-----Creating systemd unit file-----\n'
cd ../../

if [ /etc/systemd/system/app.service ];
then 
		echo $'\n-----Removing existing app.service-----\n';
		sudo rm /etc/systemd/system/app.service;
fi


echo $'\n-----Creating app.service-----\n'

var_username=$USER

echo "Created gunicorn with $1 worker processes to start"
var_workers=$1

DIR=$PWD

systemd_path="/etc/systemd/system/app.service"
systemd_content=$'[Unit]\n# specifies metadata and dependencies\nDescription=Gunicorn instance to serve project\nAfter=network.target\n# tells the init system to only start this after the networking target has been reached\n# We will give our regular user account ownership of the process since it owns all of the relevant files\n[Service]\n# Service specify the user and group under which our process will run.\nUser='$var_username$'\n# give group ownership to the www-data group so that Nginx can communicate easily with the Gunicorn processes.\nGroup=www-data\n# Well then map out the working directory and set the PATH environmental variable so that the init system knows where our the executables for the process are located (within our virtual environment).\nWorkingDirectory='$DIR$'\nEnvironment="PATH='$DIR$'/venv/bin"\n# Well then specify the commanded to start the service\nExecStart='$DIR$'/venv/bin/gunicorn --workers '$var_workers$' --bind unix:app.sock -m 007 wsgi:app\n# This will tell systemd what to link this service to if we enable it to start at boot. We want this service to start when the regular multi-user system is up and running:\n[Install]\nWantedBy=multi-user.target'
echo "$systemd_content" > $systemd_path

systemctl daemon-reload
echo $'\n-----Starting app-----\n'
sudo systemctl start app
sudo systemctl enable app


echo $'\n-----Done-----\n'
cd  Runner/scripts
