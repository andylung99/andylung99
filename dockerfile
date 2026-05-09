# 使用轻量级的 Alpine Linux 作为基础镜像
FROM alpine:latest

# 安装 Tinyproxy
RUN apk update && apk add tinyproxy

# 创建日志目录
RUN mkdir -p /var/log/tinyproxy

# 将本地的配置文件复制到镜像内
COPY tinyproxy.conf /etc/tinyproxy/tinyproxy.conf

# 复制并设置启动脚本的执行权限
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 暴露端口。这里用 8888，与配置文件中的 Port 保持一致
EXPOSE 8888

# 容器启动时执行的命令
ENTRYPOINT ["/entrypoint.sh"]