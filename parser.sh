#!/bin/bash

while true
do
#--------------------------
cd /home/ateladmin/swnew/
tail -q --max-unchanged-stats=10 -F /var/log/allswitch 2>/dev/null | while read str
do
    ./parse.sh "$str" &
done
#---------------------------
sleep 1
echo `date` error >>/home/ateladmin/swnew/err.log
done
