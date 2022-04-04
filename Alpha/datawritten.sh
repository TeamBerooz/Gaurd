#!/bin/bash

datawritten=`iostat -t | grep dm-0|awk '{print $4}'`
echo '📉 ❪ میزان داده های نوشته شده در ربات ❫\n»» '"$datawritten"' کیلوبایت در ثانیه'  