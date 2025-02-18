#!/bin/bash

mkdir /opt/test_tools/
dnf install -y git make gcc g++ python

./unixbench_test.sh
./coremark_test.sh
./dhrystone_test.sh
./sysbench_test.sh
echo -e "4\nn\n" | ./cachebench_test.sh
./stream_test.sh
./lmbench_test.sh
./stressng_test.sh
./fio_test.sh
./redis_test.sh

# 耗时较久
#./core-core_latency_test.sh
#./ltp_test.sh
