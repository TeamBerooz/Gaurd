#!/bin/bash


pingserver = `ping api.telegram.org -c2  |grep rtt |awk -F'/' '{printf "%1.6s\n", $5/1}'`

echo '❪ 📡 پینگ به تلگرام ❫ \n »» '"`ping api.telegram.org -c2  |grep rtt |awk -F'/' '{printf "%1.6s\n", $5/1}'`"' ms'




   