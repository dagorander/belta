#!/bin/bash
# PACKAGES USED:
# sysstat: needed for mpstat


CPU_READING=$(cat /sys/class/thermal/thermal_zone0/temp)


# CPU Util numbers need to be split up per core/all
# We use mpstat from sysstat with no decimals (because int is nicer than float) to get the numbers for all cores
# sed away the lines we don't need and remove duplicate spaces to make the idle field cuttable
# We are using idle because the utilization is broken up into many types of util
CPU_ALL_IDLE=$(mpstat -P all --dec=0 | sed '1,3d' | tr -s ' ' | cut -d ' ' -f 12)
CPU_0_IDLE=$(mpstat -P 0 --dec=0 | sed '1,3d' | tr -s ' ' | cut -d ' ' -f 12)
CPU_1_IDLE=$(mpstat -P 1 --dec=0 | sed '1,3d' | tr -s ' ' | cut -d ' ' -f 12)
CPU_2_IDLE=$(mpstat -P 2 --dec=0 | sed '1,3d' | tr -s ' ' | cut -d ' ' -f 12)
CPU_3_IDLE=$(mpstat -P 3 --dec=0 | sed '1,3d' | tr -s ' ' | cut -d ' ' -f 12)


#Convert the Idle numbers to utilization numbers
CPU_ALL_UTILIZATION=$((100-$CPU_ALL_IDLE))
CPU_0_UTILIZATION=$((100-$CPU_0_IDLE))
CPU_1_UTILIZATION=$((100-$CPU_1_IDLE))
CPU_2_UTILIZATION=$((100-$CPU_2_IDLE))
CPU_3_UTILIZATION=$((100-$CPU_3_IDLE))


#Then we make them sane to human eyes
CPU_TEMP=$((CPU_READING/1000))


# Here we use 'free' to get current RAM total and used, then calculate what the percentage used is
RAM_TOTAL=$(free -m | sed '1,1d' | sed '2,2d' | tr -s ' ' | cut -d ' ' -f 2)
RAM_USED=$(free -m | sed '1,1d' | sed '2,2d' | tr -s ' ' | cut -d ' ' -f 3)


# Here we get ourselves some percentages
# NEED TO FIND A WAY TO DO DECIMAL MATH IN BASH



#Output for devtesting
echo "CPU TEMP: ${CPU_TEMP}c"
echo ""
echo "CPU UTILIZATION:"
echo "ALL CORES: ${CPU_ALL_UTILIZATION}%"
echo "   CORE 0: ${CPU_0_UTILIZATION}%"
echo "   CORE 1: ${CPU_1_UTILIZATION}%"
echo "   CORE 2: ${CPU_2_UTILIZATION}%"
echo "   CORE 3: ${CPU_3_UTILIZATION}%"
echo ""
echo "RAM TOTAL: ${RAM_TOTAL}MiB"
echo "RAM USED: ${RAM_USED}MiB"
echo "RAM USAGE: ${RAM_USE_PERCENTAGE}%"