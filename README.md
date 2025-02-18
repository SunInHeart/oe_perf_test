# openEuler performance test scripts

## 测试项

* unixbench
* coremark
* Dhrystone
* sysbench
* phoronix-test-suite benchmark cachebench
* stream
* cache latency
* sterss-ng
* fio
* redis benchmark

* core-core latency
* ltp

## 运行测试

### 单独运行

注意需要安装依赖
```sh
dnf install git make gcc g++ python
```

例：运行unixbench

```sh
./unixbench.sh
```
### 运行所有

```sh
./run_all_test.sh
```

有些测试项被注释掉，实际运行的测试项见脚本

## 测试结果

所有测试结果保存在results目录下
