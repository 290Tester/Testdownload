import binascii

# 获取用户输入的十六进制数据
hex_input = input("请输入十六进制格式的二进制数据：")

# 将十六进制数据转换为二进制数据
binary_data = binascii.unhexlify(hex_input)

# 将二进制数据解码为文本
try:
    text = binary_data.decode('utf-8')
    print(text)
except UnicodeDecodeError:
    print("解码失败，可能输入的十六进制数据不是有效的UTF-8编码。")