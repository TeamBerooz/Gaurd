#!/bin/bash

CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`

echo '⚙️ ❪ پردازش Cpu ❫\n»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "''




 