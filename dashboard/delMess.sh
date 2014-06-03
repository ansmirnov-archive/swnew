#!/bin/sh

######################################################################
#
# Скрипт для удаления уведомления на стене
# USAGE: ./delMess.sh ip_host port type
#
######################################################################

source config.sh

date_=`date +%s`
echo "DELETE FROM problems2 WHERE ip_host=INET_ATON('$1') AND port='$2' AND type_event='$3';" | mysql -u$MYSQL_USER -p$MYSQL_PASS $MYSQL_TABLE
log_date=`date`
echo "[DEL] $log_date $1 $2" >> ./log/mainlog