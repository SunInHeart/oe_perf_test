import numpy as np

# 计算平均值和过滤异常值
def remove_outliers_and_average(data, threshold=3):
    # 计算均值和标准差
    mean = np.mean(data)
    std_dev = np.std(data)
    
    # 过滤异常值（标准差超过指定倍数）
    filtered_data = [x for x in data if abs(x - mean) <= threshold * std_dev]
    
    # 返回过滤后的平均值
    return np.mean(filtered_data)

# 处理每个数据段
def process_latency_data(data):
    L1_data = []
    L2_data = []
    L3_data = []

    # 按照大小划分数据
    for size, latency in data:
        if size <= 0.0625:  # L1 (64KB)
            L1_data.append(latency)
        elif 0.0625 < size <= 1:  # L2 (1MB)
            L2_data.append(latency)
        elif 1 < size <= 64:  # L3 (64MB)
            L3_data.append(latency)
    
    # 计算每组的平均值并返回
    L1_latency = remove_outliers_and_average(L1_data)
    L2_latency = remove_outliers_and_average(L2_data)
    L3_latency = remove_outliers_and_average(L3_data)

    return L1_latency, L2_latency, L3_latency

# 从文件读取数据
def read_data_from_file(filename):
    data = []
    with open(filename, 'r') as file:
        start_reading = False  # 标记是否开始读取数据
        for line in file.readlines():
            # 如果遇到 "stride=1024" 字符串，则开始读取后面的数据
            if "stride=1024" in line:
                start_reading = True
                continue  # 跳过 "stride=1024" 这一行
            
            # 只有在开始读取数据后，才处理数据行
            if start_reading:
                if line.strip():  # 忽略空行
                    size, latency = map(float, line.split())
                    data.append((size, latency))
    return data

# 主函数
def main():
    # 读取数据
    filename = 'latency_data.txt'  # 替换为你的文件路径
    data = read_data_from_file(filename)
    
    # 处理数据并计算L1、L2和L3的平均延迟
    L1_latency, L2_latency, L3_latency = process_latency_data(data)
    
    # 打印结果
    print(f"L1 latency: {L1_latency:.2f} ns")
    print(f"L2 latency: {L2_latency:.2f} ns")
    print(f"L3 latency: {L3_latency:.2f} ns")

if __name__ == "__main__":
    main()

