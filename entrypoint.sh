#!/bin/sh
set -e

echo "启动 Tinyproxy 代理服务..."

# 【关键】用 Render 动态分配的端口 ($PORT) 替换默认配置
if [ -n "$PORT" ]; then
  echo "根据 Render 环境变量，将端口修改为: $PORT"
  sed -i "s/^Port .*/Port $PORT/" /etc/tinyproxy/tinyproxy.conf
fi

echo "最终配置文件内容如下："
cat /etc/tinyproxy/tinyproxy.conf

# 在前台启动 Tinyproxy
tinyproxy -d