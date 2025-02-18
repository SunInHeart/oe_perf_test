#!/bin/bash

# 获取测试脚本
wget https://gitee.com/openeuler/test-tools/raw/master/kernel-testsuite/ltp/start_ltp_test.sh

# 运行测试脚本
sh start_ltp_test.sh | tee ./results/ltp_result.log

