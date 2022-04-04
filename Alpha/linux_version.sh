#!/bin/bash


linux_version=`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`


echo '📟 ❪ سیستم لینوکس ❫\n»» '"$linux_version"'' 




  