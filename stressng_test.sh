#!/bin/bash

# 安装压力测试
dnf install -y stress-ng

# CPU压力测试,启动4个CPU,持续60s的压力测试
stress-ng --cpu 4 --timeout 60 2>&1 | tee ./results/stressng_result.log

# 启动2个虚拟内存压力测试,分别分配1GB的内存,持续60秒
stress-ng --vm 2 --vm-bytes 1G --timeout 60 2>&1 | tee -a ./results/stressng_result.log

