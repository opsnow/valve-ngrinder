#!/bin/bash

CONTROLLER_ADDR=$1

echo "=============== start ==============="
sudo apt update
sudo apt install openjdk-8-jre-headless -y
sleep 1
java -version
while [ $? != 0 ]; do
    sudo apt update
    sudo apt install openjdk-8-jre-headless -y
    sleep 1
    java -version
done

wget --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 0 http://${CONTROLLER_ADDR}:8080/agent/download -O ~/agent.tar
tar -xf ~/agent.tar
nohup ~/ngrinder-agent/run_agent.sh -o &

echo "=============== finish ==============="
