#!/bin/bash

dnf install -y cargo

cargo install core-to-core-latency

# 添加环境变量
export PATH=~/cargo/bin:$PATH

# 执行benchmark
core-to-core-latency --csv > ./results/c2c-latency.csv

