#!/bin/bash

if echo $1 |grep -q -P '10\.254\.[0-9]*\.254'
then 
/home/ateladmin/swnew/dashboard/./showMess.sh $1 0 1 "Broadcast storm is occurring $2" 300 1
fi

