#!/bin/bash

HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
echo '💾 ❪ هارد دیسک ❫\n»» '"$HardDisk"'' 

 


