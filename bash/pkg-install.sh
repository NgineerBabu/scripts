#!/bin/bash
###############################################################################################
# # Author: SanjuD #
# # Description: To check the OS package maintainer and install required package as per user. #
###############################################################################################
USR=root
WHO=`echo $USER`
if [ "$WHO" != "$USR" ]; then
echo -e " Require root privileges unable to execute\n Run as sudo"
exit
elif [ "$WHO" == "$USR" ]; then
echo "root privileges confirmed"
sleep 2
echo "Searching for available Package Maintainer"
fi
if [ apt-get ]; then
echo -e "
\n################################
\n# Found Debian Package Manager #
\n################################
\n
\n"
apt-get update || echo "Failed due to network connection"
echo "Enter below package name"
read PKG
apt-get install -y $PKG
elif [ yum --version ]; then
echo -e "
\n#############################
\n# Found RPM Package Manager #
\n#############################
\n
\n"
yum check-update || echo "Failed due to network connection"
echo "Enter below package name"
read PKG2
yum install -y $PKG2
else
echo "No Deb or RPM package maintainer found"
fi
