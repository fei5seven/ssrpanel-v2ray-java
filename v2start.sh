#!/bin/bash
# 
cd /v2ray
nohup java -jar ssrpanel-v2ray.jar  > log.file  2>&1 &
