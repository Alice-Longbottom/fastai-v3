# 使用官方的 Python 3.13 镜像作为基础
FROM python:3.13-slim
# 设置工作目录
WORKDIR /app
# 更新包列表并安装 python3-venv
# 这一步就是解决问题的关键！
RUN apt-get update && apt-get install -y python3.13-venv && rm -rf /var/lib/apt/lists/*
# 复制依赖文件到工作目录
COPY requirements.txt .
# 安装 Python 依赖包
RUN pip install --no-cache-dir -r requirements.txt
# 复制你的所有项目文件到工作目录
COPY . .
# 暴露你的应用运行的端口
EXPOSE 10000
# 设置容器启动时要执行的命令
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "10000"]
