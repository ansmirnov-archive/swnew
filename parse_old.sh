#!/bin/bash


echo $1 >> 11

eval `echo $1 | ./normalEvent.sed`
echo $ip_host >> 2

ttl=9999999

if [[ (($type_event -eq 1) || ($type_event -eq 2)) && ((`echo $ip_host | cut -d'.' -f4` -eq 254) || ($port -eq 25) || ($port -eq 26) || ($port -eq 27) || ($port -eq 28)) ]]
then
    if [[ $type_event -eq 1 ]]
    then
	/home/ateladmin/swlog2/showMess.sh "$ip_host" "$type_event" "<b>Port $port</b> link down" "$ttl"
	echo "show $ip_host $type_event Port $port down test" "$ttl"
    fi
    if [[ $type_event -eq 2 ]]
    then
	/home/ateladmin/swlog2/delMess.sh "$ip_host" "<b>Port $port</b> link down"
	echo "hide"
    fi
fi
