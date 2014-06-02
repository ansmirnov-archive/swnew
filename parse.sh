#!/bin/bash

echo $1 > /tmp/123
#s//time=\"\1\" ip_host="\2" class_event=\3 ||/g
regex='([A-Za-z]* [0-9]* [0-9:]*) ([0-9.]*) (INFO|WARN|CRIT|logger):'
[[ $1 =~ $regex ]]
time_=${BASH_REMATCH[1]}
ip_host=${BASH_REMATCH[2]}
type_event=${BASH_REMATCH[3]}

cat __config_regexp|
while read regexp
do
    read on_match
    if [[ $1 =~ $regexp ]]
    then
	i=1
        n=${#BASH_REMATCH[*]}
	params=''
        while [[ $i -lt $n ]]
        do
            params=$params" ${BASH_REMATCH[$i]}"
            let i++
        done
#	echo $on_match $params
#	echo $1 '=~' $regexp
	$on_match $ip_host $params
	break
    fi
done
