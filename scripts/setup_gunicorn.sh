#!/usr/bin/env bash

set -e
echo $'\n-----Binding local to gunicorn-----\n'
cd ../../

sudo fuser -k 5000/tcp
gunicorn --bind 0.0.0.0:5000 wsgi:app &

echo $'\n-----Deactivating venv-----\n'

deactivate


echo $'\n-----Done-----\n'
cd  Runner/scripts
