#!/bin/bash

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

wget https://github.com/naver/ngrinder/releases/download/ngrinder-3.4.3-20190709/ngrinder-controller-3.4.3.war -O ngrinder-controller-3.4.3.war
nohup java -jar ngrinder-controller-3.4.3.war --port 8080 &

# apache-tomcat-8.5.43/bin/startup.sh &
echo "=============== finish ==============="
