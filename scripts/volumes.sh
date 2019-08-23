#!/bin/sh
# Attaching the Volumes if the disk size is greater than 90
USAGE=$(df -h / | awk '{print $5}'| tail -1 | sed 's/\%//')
if [ $USAGE -ge 90 ]; then
  if [ -e /dev/nvme0n1p1 ]; then
    ln -s /dev/nvme1n1 /dev/sdf
    ln -s /dev/nvme2n1 /dev/sdg
  else
   ln -s /dev/xvdf /dev/sdf
   ln -s /dev/xvdg /dev/sdg
  fi
  mkfs.ext4 /dev/sdf
  mkfs.ext4 /dev/sdg
  mkdir /usr/share/test/log
  mkdir /usr/share/test/data
  mount /dev/sdf /usr/share/test/log
  mount /dev/sdg /usr/share/test/data

fi

#Downloading Package
mkdir -p /usr/share/test/code
cd /usr/share/test/code
yum install wget -y
wget https://archive.apache.org/dist/incubator/druid/${druid_version}-incubating/apache-druid-${druid_version}-incubating-bin.tar.gz
tar zxvf apache-druid-${druid_version}-incubating-bin.tar.gz

#Stores Output of a file
yum install tree -y
if [ -d "/usr/share/test/log" ] 
then
    lsblk >>mountfiledata.txt
else
    mkdir -p /usr/share/test/log
    lsblk >>mountfiledata.txt
fi
if [ -d "/usr/share/test/data " ]
then
    tree /usr/share/test >>filestructure.txt
else
    mkdir -p /usr/share/test/data
    tree /usr/share/test >>filestructure.txt
fi



