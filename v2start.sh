#!/bin/bash
# 
cd /root/ssrpanel-v2ray-java
nohup java -jar ssrpanel-v2ray.jar  > log.file  2>&1 &
