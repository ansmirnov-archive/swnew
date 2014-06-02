#!/bin/sed -f

##################################################################
#
# time		Время
# ip_host	IP хоста
# class_event	Класс события
#	INFO	= 1
#	WARN	= 2
#	CRIT	= 3
#	logger	= 4
# type_script	Тип вызываемого скрипта
#	1  - Создать событие
#	2  - Удалить событие
#	0  - Создать временное событие
# type_event	Тип события
#	1  - Link down			port
#	2  - Link up			port
#	3  - Multicast shtorm		port
#	4  - Flooding MAC is detected	vid, mac
#	5  - Unauthenticated IP-MAC	ip, mac, port
#	6  - Switch responding now	ip
#	7  - Switch not responding now	ip
#	8  - System cold start
#	9  - Broadcast storm		port
#	10 - Internal Power failed
#	11 - Successful login		method, username, ip, [mac]
#	12 - Spanning Tree Protocol
#	     is disabled
#	13 - Configuration errors	nserr, neerr
#	14 - Login failed		method, username, ip, [mac]
#
##################################################################


s/\([A-Za-z]* [0-9]* [0-9:]*\) \([0-9.]*\) \(INFO\|WARN\|CRIT\|logger\):/time=\"\1\" ip_host="\2" class_event=\3 ||/g
#Mar 23 10:55:49 10.254.26.228 21: 57:59 10.254.26.228 1:
s/\([A-Za-z]* [0-9]* [0-9:]*\) \([0-9.]*\) \([0-9]*\): ..:.. [0-9.]* \(INFO\|WARN\|CRIT\|logger\):/time=\"\1\" ip_host="\2" port=\3 class_event=\4 ||/g
s/INFO/1/g
s/WARN/2/g
s/CRIT/3/g
s/logger/4/g
s/, \(10\|100\|1000\)Mbps \(FULL\|HALF\) duplex//g
s/|| Port \([0-9]*\) link down/type_script=1 ttl=99999999 type_event=1 port=\1/g
s/|| Port \([0-9]*\) link up/type_script=2 type_event=2 port=\1 mess="Port \1 link down"/g
s/|| Multicast storm \(is occurring\|has cleared\) (port: \([0-9]*\))/type_script=0 ttl=1000 type_event=3 port=\2 mess="Multicast storm on port \2"/g
s/|| Port \([0-9]*\) Multicast storm \(is occurring\|has cleared\)/type_script=0 ttl=1000 type_event=3 port=\1 Multicast storm on port \1/g
s/|| The flooding MAC is detected (VID: \([0-9]*\), MAC: \(..-..-..-..-..-..\))/type_script=0 ttl=1000 type_event=4 vid=\1 mac="\2"/g
s/|| Unauthenticated IP-MAC address and discarded by ip mac port binding (IP: \([0-9.]*\), MAC: \(..-..-..-..-..-..\), port: \([0-9]*\))/type_script=0 ttl=1000 type_event=5 ip="\1" mac="\2" port=\3/g
s/|| \([0-9.]*\) responding/type_script=1 ttl=9999999 type_event=6 ip="\1"/g
s/|| \([0-9.]*\) not_responding/type_script=2 type_event=7 ip="\1"/g
s/|| System cold start/type_script=0 ttl=1000 type_event=8/g
s/|| Broadcast storm \(is occurring\|has cleared\) (port: \([0-9]*\))/type_script=0 ttl=1000 type_event=9 port=\2/g
s/|| Internal Power failed/type_script=0 ttl=1000 type_event=10/g
s/|| Successful login through \([a-zA-Z]*\) (Username: \([a-zA-Z0-9]*\), IP: \([0-9.]*\)\(, MAC: \(..-..-..-..-..-..\)\)*)/type_script=0 ttl=1000 type_event=11 method="\1" username="\2" ip="\3" mac="\5"/g
s/|| Spanning Tree Protocol is disabled/type_script=0 ttl=1000 type_event=12/g
s/|| Configuration had \([0-9]*\) syntax error and \([0-9]*\) execute error/type_script=0 ttl=1000 type_event=13 nserr=\1 neerr=\2/g
s/|| Login failed through \([a-zA-Z]*\) (Username: \([a-zA-Z0-9]*\), IP: \([0-9.]*\)\(, MAC: \(..-..-..-..-..-..\)\)*)/type_script=0 ttl=1000 type_event=14 method="\1" username="\2" ip="\3" mac="\5"/g
