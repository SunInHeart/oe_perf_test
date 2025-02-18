#!/bin/bash

pushd /opt/test_tools/

# 下载源码
git clone https://github.com/sophgo/lmbench.git

# 安装依赖
dnf install -y libtirpc-devel

cd lmbench/

make

# 运行测试，测试总长度为256MB，每个step为1024字节
./bin/lat_mem_rd 256 1024 2>&1 | tee latency_data.txt

# 移动测试结果
popd

mv /opt/test_tools/lmbench/latency_data.txt .

# 使用python脚本计算三级缓存延迟
python compute_cache_latency.py | tee ./results/lmbench_result.log

rm -f latency_data.txt
