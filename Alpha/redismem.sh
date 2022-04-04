#!/bin/bash



redismem=`ps -e aux | grep redis|awk '{print $4}'`

echo '♾ ❪ مصرف ردیس(Ram) ❫\n»» %'"$redismem"'' 
 