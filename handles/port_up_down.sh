#!/bin/bash

ip_host=$1
port=$2

if ./checks/is_crit.sh $ip_host $port
then
    if [[ $3 == "down" ]]
    then
	./dashboard/showMess.sh $ip_host $port 1 "Port $port link down" 999999 1
    else
	./dashboard/delMess.sh $ip_host $port 1
    fi
fi