#!/bin/bash

pushd /opt/test_tools/

# 下载源码
git clone https://github.com/jeffhammond/STREAM

cd STREAM/

# 编译
make stream_c.exe

# 执行测试
./stream_c.exe | tee stream_result.log

# 移动测试结果
popd

mv /opt/test_tools/STREAM/stream_result.log ./results/

