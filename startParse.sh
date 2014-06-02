#!/bin/bash

exit

run=`ps -e | grep parse`
if [[ "$run" == "" ]]
then
    /usr/bin/screen -AmdS parse /home/ateladmin/swnew/parse.sh
fi