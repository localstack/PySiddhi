#!/bin/bash

# install build dependencies
apt update
apt install -y build-essential openjdk-11-jdk python3-dev libboost-python-dev maven

# prepare the thread fix code
cd __PySiddhiProxy/threadfix_c_code
make clean all || exit 1

# build the java dependency
cd ..
mvn clean install

# build the wheel
cd ..

## install source requirements
pip install -r Requirements.txt

## install python build tools
pip install --upgrade pip setuptools wheel build

## build!
python -m build -n .
