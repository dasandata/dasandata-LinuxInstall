#!/bin/bash

PROMPT="[${USER}@${HOSTNAME%%.*}]#"

Date1=$(date "+%Y-%m-%d %H:%M:%S")

# Log File
export LOGFILE="/root/dasan_Maintenance_${Date1}.txt"

date | tee -a "$LOGFILE"

cat /root/banner.sample | tee -a "$LOGFILE"

echo ""
echo ""
echo "==================== postech-cseedu check ===================="
echo "==================== postech-cseedu check ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""

echo " node list " >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} wwsh node list | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
wwsh node list | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Master Power ===================="
echo "==================== Master Power ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} dmidecode -t chassis | grep 'Power Supply State'  " >> "/root/dasan_Maintenance_${Date1}.txt"
dmidecode -t chassis | grep "Power Supply State" | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Node Power ===================="
echo "==================== Node Power ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-10] dmidecode -t chassis | grep "Power Supply State" | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-10] dmidecode -t chassis | grep "Power Supply State" | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== HDD Check ===================="
echo "==================== HDD Check ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} lsblk " >> "/root/dasan_Maintenance_${Date1}.txt"
lsblk | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo -e  "${PROMPT} df -h  | grep -v tmpfs | grep -v overlay " >> "/root/dasan_Maintenance_${Date1}.txt"
df -h  | grep -v tmpfs | grep -v overlay | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Nic Check ===================="
echo "==================== Nic Check ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-10] ifconfig eth1 | grep 10.10.10 | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-10] ifconfig eth1 | grep 10.10.10 | sort -V  | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Port Speed Check ===================="
echo "==================== Port Speed Check ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-10] ethtool eth1 | grep -i speed | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-10] ethtool eth1 | grep -i speed | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Port Check ===================="
echo "==================== Port Check ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-10] ifconfig eth1 | grep 10.10.10 | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-10] ifconfig eth1 | grep 10.10.10 | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== Mount Point Check ===================="
echo "==================== Mount Point Check ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-10] df -h | grep "cseedu" | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-10] df -h | grep "cseedu" | sort -V | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo ""
echo ""
echo "==================== GPU Check ===================="
echo "==================== GPU Check ====================" >> "/root/dasan_Maintenance_${Date1}.txt"
echo ""
echo ""
echo -e  "${PROMPT} pdsh -w n[1-10] nvidia-smi -L | sort -V " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-10] nvidia-smi -L | sort -V  | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"

echo -e  "${PROMPT} pdsh -w n[1-10] nvidia-smi -L | sort -V | wc -l " >> "/root/dasan_Maintenance_${Date1}.txt"
pdsh -w n[1-10] nvidia-smi -L | sort -V | wc -l | tee -a "$LOGFILE"

echo -e  "${PROMPT}   " >> "/root/dasan_Maintenance_${Date1}.txt"
