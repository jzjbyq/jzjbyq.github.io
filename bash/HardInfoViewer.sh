#!/bin/bash
if [ -f /etc/redhat-release ]; then
	echo "redhat_enable_cron"   kill_redhat_firewall
elif [[ $ID =~ "Ubuntu" || $PRETTY_NAME =~ "Ubuntu" ]]; then
	echo "ubuntu_enable_cron"   kill_ubuntu_firewall
elif [[ $lsb =~ "Debian" || $PRETTY_NAME =~ "Debian" ]]; then
	echo "debian_enable_cron"   kill_unknown_firewall
elif [[ $lsb =~ "SUSE" || $PRETTY_NAME =~ "SUSE" ]]; then
    echo "suse_enable_cron"     kill_unknown_firewall
elif [[ $lsb =~ "NeoKylin" || $PRETTY_NAME =~ "NeoKylin" ]]; then
    echo "中标麒麟：redhat_enable_cron"   kill_redhat_firewall
elif [[ $lsb =~ "Kylin" || $PRETTY_NAME =~ "Kylin" ]]; then
    echo "银河麒麟：ubuntu_enable_cron"   kill_ubuntu_firewall
else
	echo "Warn: Bypass system check"
fi

OSVER=`cat /etc/lsb-release |grep DISTRIB_DESCRIPTION|cut -d "=" -f 2|sed 's/"//g'`
OSVER2=`cat /etc/redhat-release`
KER=`uname -rsp`
CPUVER=`lscpu|grep "Model name"|awk -F ":" '{print $2}'|sed 's/^[ ]*//g'`
CPUVER2=`lscpu|grep "型号名称"|awk -F "：" '{print $2}'|sed 's/^[ ]*//g'`
wait
MEMSIZE=`cat /proc/meminfo|grep "MemTotal"|awk '{print $2/1024}'|awk -F "." '{print $1}'`
CPUNUM=`grep 'physical id' /proc/cpuinfo | sort -u | wc -l`
CPUCORE=`grep 'core id' /proc/cpuinfo | sort -u | wc -l`
CPUPRO=`grep 'processor' /proc/cpuinfo | sort -u | wc -l`
clear
echo -e "--------------------------------------------------"
echo -e "   _____                         _ _             "
echo -e "  / ____|                       | (_)            "
echo -e " | |     ___  _ __   __ _       | |_ _ __   __ _ "
echo -e " | |    / _ \| '_ \ / _\` |  _   | | | '_ \ / _\` |"
echo -e " | |___| (_) | | | | (_| | | |__| | | | | | (_| |"
echo -e "  \_____\___/|_| |_|\__, |  \____/|_|_| |_|\__, |"
echo -e "                     __/ |                  __/ |"
echo -e "                    |___/                  |___/"
echo -e " " 
echo -e "                          HardInfo Viewer By 2020"
echo -e "--------------------------------------------------"
echo -e "HardInfo Viewer "
echo -e "  OS:     "$OSVER$OSVER2
echo -e "  Kernel: "$KER 
echo -e "  CPU:    "$CPUVER$CPUVER2" * "$CPUNUM
echo -e "  CORE:    * "$CPUCORE
echo -e "  PROCESS: * "$CPUPRO
echo -e "  RAM:    "$MEMSIZE" MB"
