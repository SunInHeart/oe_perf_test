#!/bin/bash

dnf install -y unixbench

pushd /opt/unixbench/

# 运行单核测试
./Run | tee unixbench_result.log

# 修改默认最大运行线程数
sed -i '109s/16/64/; 112s/16/64/' Run

# 运行多核测试
./Run -c 64 | tee -a unixbench_result.log

# 移动测试结果
popd
mv /opt/unixbench/unixbench_result.log ./results/
