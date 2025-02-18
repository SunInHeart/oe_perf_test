#!/bin/bash

pushd /opt/test_tools/

# 下载源码
git clone https://github.com/Keith-S-Thompson/dhrystone

cd dhrystone/v2.2

# 运行测试
sh dry.c | tee dhrystone_result.log

# 移动测试结果
popd

mv /opt/test_tools/dhrystone/v2.2/dhrystone_result.log ./results/

