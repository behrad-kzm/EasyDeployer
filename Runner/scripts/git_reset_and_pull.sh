#!/bin/bash

echo $'\n-----Updating git local branch-----\n'
cd ../../

git reset --hard
echo $'pulling from git...'
git pull

echo $'\n-----Done-----\n'
cd  Runner/scripts