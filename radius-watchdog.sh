#!/bin/sh
# /usr/local/etc/rc.d/radiusd-watchdog.sh
# Author: Per Nesager Toft (pto@telenor.dk)
# Descr: This scripts shall be placed in /usr/local/etc/rc.d/ and will be started on boot. It will check if the radiusd process is alive, and reboot the process if it fails.
# Date: 2015-07-28


PROCESS=radiusd

(while :
do

PID=`pgrep ${PROCESS}`
if [ $PID ];
then
        kill -0 $PID
        if [ $? != 0 ];
        then
                echo "Radius not respoding.... ristarting radiusd...."
                /usr/local/etc/rc.d/radiusd.sh restart
        fi

else
                echo "radiusd not running.... Restarting "
                /usr/local/etc/rc.d/radiusd.sh restart
fi

sleep 5
done)&
