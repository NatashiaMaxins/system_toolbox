#!/bin/bash

alertname="$1"
target="$2"
losspattern="$3"
rtt="$4"
hostname="$5"
#檢查資料夾是否存在，若不存在則新增資料夾
test -d /opt/smokeping/mtr/$5/
y=$?
if [ "${y}" == 1 ] ; then mkdir /opt/smokeping/mtr/$5/
fi
#主程序
mtr -c 50 -r $5 > /opt/smokeping/mtr/$5/$(date +%Y%m%d-%H:%M).txt
