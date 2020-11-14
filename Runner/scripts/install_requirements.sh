#!/bin/bash

echo $'\n-----Installing Gunicorn-----\n'
cd ../../

pip3 install gunicorn flask

echo $'\n-----Installing requirements.txt-----\n'
pip3 install -r requirements.txt


echo $'\n-----Done-----\n'
cd  Runner/scripts
