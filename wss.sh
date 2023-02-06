#!/bin/sh
#


echo
echo Dit is een setup

#if false; then

apt-get remove apt-listchanges -y
apt-get update -y
apt-get upgrade -y
#timedatectl set-timezone Europe/Amsterdam
#sed -i 's/"gb"/"us"/g' /etc/default/keyboard

#mkdir /mnt/ramdisk
#echo tmpfs    /mnt/ramdisk    tmpfs    defaults,noatime,nosuid,size=200m    0 0 >> /etc/fstab

apt-get install mc hdparm screen sendemail nmap autossh arp-scan lsof -y

if [[ ! -f $HOME/.ssh/id_rsa ]]
then
    echo "create ssh key."
    ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''  
else
    echo "ssh key already exist."
fi


#cd /usr/share/arp-scan/ && get-oui -u https://linuxnet.ca/ieee/oui.txt

#sed -i 's/raspberrypi/RASPI-BUSTER2/g' /etc/hostname
#sed -i 's/raspberrypi/RASPI-BUSTER2/g' /etc/hosts
#hostname RASPI-BUSTER2

#apt-autoremove -y

#fi


echo Is this a rapsberry or a fysical debian or a virtual system
echo Im not sure i can recognise a esxi but i will try
tmpid=`cat /etc/os-release | grep "ID=" | grep -v VERSION | grep -v VARIANT`
tmpver=`cat /etc/os-release | grep VERSION=\"`

system=unknown
subsystem=unknow

if [ "$tmpid" = "ID=fedora" ] ; then
 system=fedora
fi

if [ "$tmpid" = "ID=raspbian" ] ; then
 system=raspbian
 echo hier moet ik verder zoeken naar de hardwareversie om het een beetje compleet te maken
 hardwaresystem=$(tr -d '\0' < /proc/device-tree/model)
fi


if [ "$system" = "unknow" ] ; then
 echo dit is een onbekend systeem
 echo tmpid is gelijk aan $tmpid en er moet dus een update komen van het setupscript
else
 echo system is $system
 echo hardwaresystem is $hardwaresystem
 echo version is $tmpver
fi




echo dit is einde
