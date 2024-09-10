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