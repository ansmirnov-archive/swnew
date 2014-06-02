#!/bin/sh

echo $1

#type_event=1
#port=25
#ip_switch=10.254.1.25

#if [[ (($type_event -eq 1) || ($type_event -eq 2)) && ((`echo $ip_switch | cut -d'.' -f4` -eq 254) || ($port -eq 25) || ($port -eq 26) || ($port -eq 27) || ($port -eq 28)) ]]
#then
#    if [[ $type_event -eq 1 ]]
#    then
#	echo show
#    fi
#    if [[ $type_event -eq 2 ]]
#    then
#	echo hide
#    fi
#fi
