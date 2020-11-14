#!/bin/bash

cd ../../

echo $'\n-----Updating local packages-----\n'
sudo apt-get update

echo $'\n-----Installing dependencies-----\n'
sudo apt-get install python3-pip python3-dev nginx

echo $'\n-----Done-----\n'
cd  Runner/scripts