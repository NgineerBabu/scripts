#!/bin/bash
# Author: Sanju P Debnath

MP="$(echo {dev,dev/pts,sys,proc})"
UM="$(echo {dev/pts,dev,sys,proc})"

 if [ "$1" == "-h" ]
then
echo -e "This is a bind mount script which require while chrooting the directory\nwith require objects to be use in chroot environment to fork\n -h  : Help menu\n-u  : Unmount bind mounts\n-m  : Mount bind devices\n\nExample:\n bm -m /target/chroot/directory"

 elif [ $2 ]
then
 if [ "$1" == "-m" ]
then
 for M in $MP
do mount --bind /$M $2/$M
 done
elif [ "$1" == "-u" ];
then
 for U in $UM 
do umount $2/$U
 done
else
 echo -e "sytax error; use below command to see help menu\n\n bm -h"
 exit 2
fi
else
 echo -e "sytax error; use below command to see help menu\n\n bm -h"
 exit 2
fi
