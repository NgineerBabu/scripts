#!/bin/bash
#Author: Sanju D
STATUS=`service tomcat status | grep not`
SUB="Tomcat service Notification"
RECV="dsanju@sanjud.net"
if [ -n "$STATUS" ] ;
then
service tomcat start 
else
exit
fi

## Mail Notification
if [ -z "$STATUS" ];
then
echo "Successfully started Tomcat service" | mail -s $SUB $RECV
else
exit
fi
