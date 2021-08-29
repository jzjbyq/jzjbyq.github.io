#!/bin/bash
clear
echo -e "\t\t修改前请先备份 /etc/udev/rules.d/80-udisks2.rules 文件"
echo -e "\t\t本脚本仅在UOS系统下测试使用，如修改后出现问题可以进入 live 进行还原"
echo ""
#固定输出宽度
tab_len="%-20s %-30s %-30s"
printf "$tab_len" NAME MOUNT UUID
echo 
for i in `df -h|grep /|awk '{print $1}'`
do
    for j in `blkid|grep $i|awk -F 'UUID="' '{print $2}'|awk -F '"' '{print $1}'`
    do
        printf "$tab_len" $i `df -h |grep $i|awk '{print $6}'` $j
        echo ""
        #echo -e " ENV{ID_FS_UUID}==\"$j\",ENV{UDISKS_IGNORE}=\"1\""
    done
done
echo -e "\n每行对应一个挂载盘\n复制下面对应的行，粘贴到 /etc/udev/rules.d/80-udisks2.rules 文件中"
echo -e "重启电脑即可隐藏对应挂载盘\n"
for i in `df -h|grep /|awk '{print $1}'`
do
    for j in `blkid|grep $i|awk -F 'UUID="' '{print $2}'|awk -F '"' '{print $1}'`
    do
        echo -e "ENV{ID_FS_UUID}==\"$j\",ENV{UDISKS_IGNORE}=\"1\""
    done
done