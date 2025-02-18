#!/bin/bash

# 安装Redis
dnf install -y redis

# 启动服务
systemctl start redis

# 运行测试，示例,-n:指定要执行的请求总数,-q: 以安静模式运行,只输出最终统计信息
redis-benchmark -n 100000  -q | tee ./results/redis_result.log

