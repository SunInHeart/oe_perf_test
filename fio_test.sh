#!/bin/bash

dnf install -y fio

# 读测试命令，非破坏性测试
fio -filename=/dev/nvme0n1 -direct=1 -iodepth 1 -thread -rw=read -ioengine=libaio -bs=1M -size=10G -numjobs=64 -runtime=60 -group_reporting -name=nvme | tee ./results/fio_result.log

# 写测试命令，破坏性测试，可以通过指定临时测试文件避免破坏系统
touch /mnt/testfile
chmod 666 /mnt/testfile

fio -filename=/mnt/testfile -direct=1 -iodepth 1 -thread -rw=write -ioengine=libaio -bs=1M -size=10G -numjobs=64 -runtime=60 -group_reporting -name=nvme | tee -a ./results/fio_result.log

rm -f /mnt/testfile

