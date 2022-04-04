#!/bin/bash



uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"روز,",h+0,"ساعت,",m+0,"دقیقه."}'`


echo '🔌 ❪ خاموشی سرور ❫\n»» '"$uptime"''



  