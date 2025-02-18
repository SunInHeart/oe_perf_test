#!/bin/bash

pushd /opt/test_tools/

# 下载源码
git clone https://github.com/phoronix-test-suite/phoronix-test-suite.git

cd phoronix-test-suite/

./install-sh

dnf install -y php-cli php-xml php-json

# 执行测试
phoronix-test-suite benchmark cachebench | tee cachebench_result.log

# 移动测试结果
popd

mv /opt/test_tools/phoronix-test-suite/cachebench_result.log ./results/

