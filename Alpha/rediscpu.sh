#!/bin/bash



rediscpu=`ps -e aux | grep redis|awk '{print $3}'`

echo '®️ ❪ مصرف ردیس(Cpu) ❫\n»» %'"$rediscpu"'' 


 

