#!/bin/bash

# Cài đặt ngrok trên ubuntu nếu chưa cài đặt
if ! command -v ngrok &> /dev/null
then
    echo "Ngrok chưa được cài đặt. Đang cài đặt ngrok..."
    curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc \
	| sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null \
	&& echo "deb https://ngrok-agent.s3.amazonaws.com buster main" \
	| sudo tee /etc/apt/sources.list.d/ngrok.list \
	&& sudo apt update \
	&& sudo apt install ngrok
    echo "Ngrok đã được cài đặt"
fi

# Thay đổi phiên bản Java mặc định
# Tự động chọn lựa chọn "0" cho auto mode
echo "Đang thay đổi sang chế độ tự động chọn phiên bản Java có ưu tiên cao nhất (auto mode)..."
sudo update-alternatives --auto java

# Tự động thay đổi javac sang auto mode
# sudo update-alternatives --auto javac

# Kiểm tra lại phiên bản Java sau khi thay đổi
echo "Phiên bản Java hiện tại:"
java -version

# Cài đặt screen để chạy ngrok ở chế độ background
if ! command -v screen &> /dev/null
then
    echo "Screen chưa được cài đặt. Đang cài đặt screen..."
    sudo apt install screen -y
    echo "Screen đã được cài đặt"
fi
