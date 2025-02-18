#!/bin/bash

dnf install -y sysbench

# 单核测试
sysbench cpu --cpu-max-prime=20000 --threads=1 run | tee ./results/sysbench_result.log

# 多核测试
sysbench cpu --cpu-max-prime=20000 --threads=64 run | tee -a ./results/sysbench_result.log

