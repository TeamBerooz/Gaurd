#!/bin/bash

dataread=`iostat -t | grep dm-0|awk '{print $3}'`
echo '📈 ❪ مقدار داده خوانده شده از ربات ❫\n»» '"$dataread"' کیلوبایت در ثانیه' 