#!/bin/bash



memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`

echo '🔖 ❪ رم سرور ❫\n»» '"$memUsedPrc"'' 


 

