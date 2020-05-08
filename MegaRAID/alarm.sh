#!/bin/bash
#check raid disk status
echo Start RAID HDD status scan at $(date) >> /var/log/Checkdisk.log
MEGACLI="/usr/local/sbin/MegaCli"
$MEGACLI -pdlist -aALL  | grep "Firmware state" | awk -F : '{print $2}' | awk -F , '{print $1}' >/tmp/firmware.log
$MEGACLI -pdlist -aALL  | grep -E "Media Error|Other Error" | awk -F : '{print $2}' >/tmp/disk.log
$MEGACLI -pdlist a0 | awk -f /root/shell/pdlist.awk > /tmp/RAID.txt
for i in `cat < /tmp/disk.log`
do
if [ $i -ne 0 ]
       then
echo "Some Disk might fail quickly, please check now." | mail -s 'FreeNAS Disk Alarm' your@example.com 
fi
done
for i in `cat < /tmp/firmware.log`
do
if [ $i !=  Online ]
       then
mail -s 'FreeNAS Disk Fatal Error' your@example.com < /tmp/RAID.txt
fi
done
echo RAID HDD Status scan finished at $(date) >> /var/log/Checkdisk.log 
