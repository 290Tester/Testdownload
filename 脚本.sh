#!/bin/sh
echo "使用/system/bin/sh 请注意不要使用MT除非ROOT了"
echo "示例  sh /data/local/tmp/APK/脚本.sh"
echo "示例2 ./ /data/local/tmp/APK/脚本.sh"
echo "请确认apk是否在当前目录下"
echo "建议在/data/local/tmp/APK/下运行"
echo "开始安装"

# 安装APK
for apk in *.apk; do
    if [ -f "$apk" ]; then
        echo "Installing $(basename $apk)..."
        pm install -r "$apk"
        if [ $? -eq 0 ]; then
            echo "$(basename $apk) installed successfully."
        else
            echo "Failed to install $(basename $apk)."
        fi
    fi
done

echo "安装完成"

echo '
  ____                  ______ _    _ _               _   _ 
 |  _ \           ____ |  ____| |  | | |        /\   | \ | |
 | |_) |_   _    / __ \| |__  | |  | | |       /  \  |  \| |
 |  _ <| | | |  / / _` |  __| | |  | | |      / /\ \ | . ` |
 | |_) | |_| | | | (_| | |    | |__| | |____ / ____ \| |\  |
 |____/ \__, |  \ \__,_|_|     \____/|______/_/    \_\_| \_|
         __/ |   \____/                                     
        |___/                                               
'
echo "删除APK..."
rm -rf *.apk
echo "删除完成"
echo "脚本结束"
exit 0
