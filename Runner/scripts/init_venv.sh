#!/usr/bin/env bash

set -e

echo $'\n-----Initiating Venv-----\n'
cd ../../

if [ -d venv/ ];
then 
		echo $'\n-----Removing existing venv directory-----\n';
		sudo rm -Rf ../../venv;
fi


echo $'\n-----Creating venv-----\n'
python3 -m venv venv

source venv/bin/activate
echo $'\n-----Activating venv-----\n'


echo $'\n-----Done-----\n'
cd  Runner/scripts




