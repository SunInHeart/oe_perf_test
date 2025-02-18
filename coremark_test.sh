#!/bin/bash

pushd /opt/test_tools/

# 下载源码
git clone https://gitee.com/ssri-mirrors/coremark

cd coremark/

# 单核性能测试
rm -f coremark.exe

make

./coremark.exe | tee coremark_result.log

# 多核性能测试
rm -f coremark.exe

make XCFLAGS="-g -DMULTITHREAD=64 -DUSE_FORK=1"

./coremark.exe | tee -a coremark_result.log

# 移动测试结果
popd

mv /opt/test_tools/coremark/coremark_result.log ./results/

