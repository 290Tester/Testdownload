import binascii

# 获取用户输入的文本
user_input = input("请输入一段文本：")

# 将文本转换为二进制数据
binary_data = binascii.hexlify(user_input.encode())

# 打印十六进制格式的二进制数据
print(binary_data)