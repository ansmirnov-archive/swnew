#!/bin/sh

######################################################################
#
# Скрипт для удаления уведомления на стене
# USAGE: ./delMess.sh ip_host port type
#
######################################################################

date_=`date +%s`
echo "DELETE FROM problems2 WHERE ip_host=INET_ATON('$1') AND port='$2' AND type_event='$3';" | mysql -u... -p... syslogdog
log_date=`date`
echo "[DEL] $log_date $1 $2" >> ./log/mainlog