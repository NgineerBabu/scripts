#!/bin/bash
## Author: SanjuD
## Description: Change hostname in linux machine
HELP="Command to change hostname:\n
To change hostname in linux enter command as mentioned below\n
but after accessing machine as root user\n
changehostname <your hostname> \n
And reboot the machine to take effect.
for example: changehostname ltp-w-mum-320"
if [ $1 ]; then
sed "s/`awk '{print $2}' /etc/hosts | sed -n 2p`/$1/g" /etc/hosts -i
cat /etc/hosts
echo "$1" >  /etc/hostname
cat /etc/hostname
else
echo -e $HELP
fi
