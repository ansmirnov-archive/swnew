#!/bin/sh

######################################################################
#
# Скрипт для публикации уведомления на стене
# USAGE: ./showMess.sh ip_host port type_event mess ttl
#
######################################################################

source config.sh

date_=`date +%s`
#echo "INSERT INTO problems2 (ip_host, port, type_event, time, mess, ttl, style) VALUES (INET_ATON('$1'), $2, $3, $date_, '$4', $5, $6);"
echo "INSERT INTO problems2 (ip_host, port, type_event, time, mess, ttl, style) VALUES (INET_ATON('$1'), $2, $3, $date_, '$4', $5, $6);" | mysql -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_TABLE
log_date=`date`
echo "[ADD]" $log_date $1 $2 $3 $4 $5 $6 >> ./log/mainlog
