#!/bin/bash

echo $'\n-----Welcome to the EasyDeployer-----\n'

cd scripts
source git_reset_and_pull.sh
source install_apt_tools.sh
source init_venv.sh
source install_requirements.sh
source setup_gunicorn.sh
source setup_systemd.sh $2
source config_nginx.sh $1

echo $'\n-----Deployment Completed-----\n'